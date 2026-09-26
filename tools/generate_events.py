#!/usr/bin/env python3
"""Validate the authored event catalog and generate its C table and reference."""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data" / "events.json"
C_OUT = ROOT / "src" / "event_catalog.c"
DOC_OUT = ROOT / "docs" / "EVENTS.md"
EVENT_COUNT = 200
NONE = 255

FIELDS = {
    "id", "name", "description", "effect", "min_cycle", "group", "chain",
    "duration", "target", "min_response", "required_trait", "type_mask",
    "min_active", "min_dead", "mitigate", "branch", "branch_trait",
    "next_true", "next_false",
}
TARGETS = {
    0: "any living region", 1: "active cases", 2: "healthy population",
    3: "hot region", 4: "cold region", 5: "humid region", 6: "dry region",
    7: "urban region", 8: "rural region", 9: "healthcare region",
    10: "sea port", 11: "airport",
}
BRANCHES = {
    0: "always", 1: "owns a trait", 2: "severity is at least 20",
    3: "deaths in the selected region are at least 25%",
    4: "active cases in the selected region are at least 50%",
    5: "cure is at least 50%", 6: "response is escalating",
}
TRAITS = [
    "Air I", "Air II", "Water I", "Water II", "Livestock I", "Livestock II",
    "Rodents I", "Rodents II", "Insects I", "Insects II", "Birds I", "Birds II",
    "Blood I", "Blood II", "Aerosol Persistence", "Animal Reservoirs", "Vector Adaptation",
    "Cough", "Sneezing", "Pneumonia", "Respiratory Failure", "Nausea", "Vomiting",
    "Diarrhea", "Systemic Collapse", "Rash", "Fever", "Immune Suppression",
    "Organ Failure", "Heat Adaptation I", "Heat Adaptation II", "Cold Adaptation I",
    "Cold Adaptation II", "Medical Resistance I", "Medical Resistance II",
    "Genetic Hardening I", "Genetic Hardening II", "Genetic Reshuffle I", "Genetic Reshuffle II",
]
GROUPS = [
    "Public gatherings", "Passenger travel", "Shipping", "Weather",
    "Water and sanitation", "Animal transmission", "Healthcare", "Research",
    "Public behavior", "Infrastructure disruption",
]
STORYLINES = [
    "World Games", "Regional festival", "Crowdsourced cure project",
    "Patient Zero investigation", "Airline sanitation rollout", "Shipping sanitation rollout",
    "Migration season", "Livestock outbreak", "Insect population boom", "Rodent infestation",
    "Flood emergency", "Earthquake recovery", "Coastal storm season", "Heatwave",
    "Severe winter", "Drought and water rationing", "Hospital overload",
    "International research coalition", "Public confidence crisis", "Emergency government response",
]
SPREAD_TRAITS = {0, 2, 4, 6, 8, 12}


def fail(message: str) -> None:
    raise ValueError(message)


def require(condition: bool, message: str) -> None:
    if not condition:
        fail(message)


def expect_int(value, label: str, low: int, high: int) -> None:
    require(type(value) is int and low <= value <= high,
            f"{label} must be an integer from {low} to {high}; got {value!r}")


def validate(events: list[dict]) -> None:
    require(isinstance(events, list), "catalog root must be a JSON array")
    require(len(events) == EVENT_COUNT, f"expected {EVENT_COUNT} entries, got {len(events)}")
    by_id = {}
    for pos, event in enumerate(events):
        require(isinstance(event, dict), f"entry {pos} must be an object")
        extra = set(event) - FIELDS - {"storyline_title"}
        missing = FIELDS - set(event)
        require(not missing, f"entry {pos} missing fields: {sorted(missing)}")
        require(not extra, f"entry {pos} has unknown fields: {sorted(extra)}")
        i = event["id"]
        expect_int(i, f"entry {pos}.id", 0, EVENT_COUNT - 1)
        require(i not in by_id, f"duplicate event id {i}")
        by_id[i] = event
        require(i == pos, "entries must be ordered by stable ID")
        for field in ("name", "description"):
            require(all(32 <= ord(c) <= 126 for c in event[field]), f"event {i}: text must be printable ASCII")
        require(isinstance(event["name"], str) and event["name"].strip(), f"event {i}: missing headline")
        require(len(event["name"]) <= 43, f"event {i}: headline exceeds 43 characters")
        require(isinstance(event["description"], str) and event["description"].strip(), f"event {i}: missing description")
        require(len(event["description"]) <= 150, f"event {i}: description exceeds 150 characters")
        for key, low, high in (("min_cycle", 0, 65535), ("group", 0, 9),
                               ("chain", 0, 255), ("duration", 1, 255),
                               ("target", 0, 11), ("min_response", 0, 3),
                               ("required_trait", 0, 255), ("type_mask", 1, 7),
                               ("min_active", 0, 100), ("min_dead", 0, 100),
                               ("mitigate", 0, 255), ("branch", 0, 6),
                               ("branch_trait", 0, 255), ("next_true", 0, 255),
                               ("next_false", 0, 255)):
            expect_int(event[key], f"event {i}.{key}", low, high)
        expected_chain = NONE if i < 100 else (i - 100) // 5
        require(event["chain"] == expected_chain,
                f"event {i}: chain must be {expected_chain}, got {event['chain']}")
        if i < 100:
            require("storyline_title" not in event, f"standalone event {i} cannot have storyline_title")
            require(event["duration"] in (8, 16, 24), f"standalone event {i} duration must be 8, 16, or 24")
            require(event["branch"] == 0 and event["next_true"] == NONE and event["next_false"] == NONE,
                    f"standalone event {i} cannot branch")
        else:
            chain_pos = (i - 100) % 5
            if chain_pos == 0:
                title = event.get("storyline_title")
                require(isinstance(title, str) and title == STORYLINES[(i - 100) // 5],
                        f"event {i}: storyline_title must be {STORYLINES[(i - 100) // 5]!r}")
            else:
                require("storyline_title" not in event,
                        f"only a storyline root can have storyline_title (event {i})")
            require(event["duration"] == 16, f"story event {i} duration must be 16 cycles")
        require(isinstance(event["effect"], list) and len(event["effect"]) == 2,
                f"event {i}: effect must contain exactly two slots")
        active = 0
        for n, effect in enumerate(event["effect"]):
            require(isinstance(effect, dict) and set(effect) == {"kind", "trait", "amount"},
                    f"event {i} effect {n}: expected kind, trait, and amount")
            expect_int(effect["kind"], f"event {i} effect {n}.kind", 0, 8)
            expect_int(effect["trait"], f"event {i} effect {n}.trait", 0, 255)
            expect_int(effect["amount"], f"event {i} effect {n}.amount", -128, 127)
            kind, trait, amount = effect["kind"], effect["trait"], effect["amount"]
            if kind == 0:
                require(trait == NONE and amount == 0, f"event {i}: empty effect must use trait 255 and amount 0")
                continue
            active += 1
            require(amount != 0, f"event {i}: active effect {n} cannot have a zero amount")
            if kind == 1:
                require(trait == NONE or trait in SPREAD_TRAITS,
                        f"event {i}: spread contribution trait {trait} is not a supported transmission root")
            else:
                require(trait == NONE, f"event {i}: non-spread effect {n} must use trait 255")
            if kind in (7, 8):
                require(amount == 1, f"event {i}: route closure effect must use amount 1")
            else:
                require(-50 <= amount <= 50, f"event {i}: percentage effect {n} exceeds +/-50%")
        require(active > 0, f"event {i}: every authored event must change gameplay")
        require(event["required_trait"] == NONE or event["required_trait"] < len(TRAITS),
                f"event {i}: invalid required_trait")
        require(event["mitigate"] == NONE or event["mitigate"] < len(TRAITS),
                f"event {i}: invalid mitigation trait")
        if event["branch"] == 1:
            require(event["branch_trait"] < len(TRAITS), f"event {i}: owns branch needs a valid trait")
        else:
            require(event["branch_trait"] == NONE, f"event {i}: branch_trait only applies to owns branches")
        for key in ("next_true", "next_false"):
            nxt = event[key]
            require(nxt == NONE or nxt < EVENT_COUNT, f"event {i}: invalid {key} {nxt}")
        for effect in event["effect"]:
            if effect["kind"] == 1 and effect["amount"] > 0 and effect["trait"] != NONE:
                require(event["mitigate"] != effect["trait"],
                        f"event {i}: a transmission upgrade cannot halve its own positive spread boost")
    require(len({e["name"] for e in events}) == EVENT_COUNT, "headlines must be unique")
    require(sorted(by_id) == list(range(EVENT_COUNT)), "IDs must be exactly 0 through 199")

    for group in range(10):
        ids = [e["id"] for e in events if e["id"] < 100 and e["group"] == group]
        require(len(ids) == 10, f"standalone group {group} must contain ten events; got {len(ids)}")
    for chain in range(20):
        root = 100 + chain * 5
        stages = [by_id[root + n] for n in range(5)]
        require(stages[0]["next_true"] == root + 1 and stages[0]["next_false"] == NONE,
                f"storyline {chain}: onset must lead to escalation")
        branch = stages[1]
        require(branch["branch"] != 0, f"storyline {chain}: escalation needs an explicit branch condition")
        require(branch["next_true"] == root + 2 and branch["next_false"] == root + 3,
                f"storyline {chain}: escalation must select the two authored outcomes")
        require(stages[2]["next_true"] == root + 4 and stages[2]["next_false"] == NONE,
                f"storyline {chain}: first outcome must join at aftermath")
        require(stages[3]["next_true"] == root + 4 and stages[3]["next_false"] == NONE,
                f"storyline {chain}: second outcome must join at aftermath")
        require(stages[4]["next_true"] == NONE and stages[4]["next_false"] == NONE,
                f"storyline {chain}: aftermath must terminate")
        for n, stage in enumerate(stages):
            require(n == 1 or stage["branch"] == 0, "non-branch stages must advance unconditionally")
            require(stage["group"] == stages[0]["group"], f"storyline {chain}: stages must share a category")
        if branch["branch"] == 1:
            require(stages[0]["required_trait"] != branch["branch_trait"],
                    f"storyline {chain}: root cannot require the trait tested by its owns branch")


def c_quote(value: str) -> str:
    return json.dumps(value, ensure_ascii=True)


def render_c(events: list[dict]) -> str:
    rows = [
        '#include "events.h"',
        "",
        "const event_def_t event_catalog[WORLD_EVENT_COUNT] = {",
    ]
    for e in events:
        fx = e["effect"]
        rows.append(f"    /* {e['id']:03d}: {e['name']} */")
        rows.append(
            "    { " + f"{c_quote(e['name'])}, {c_quote(e['description'])}, "
            + "{{" + f"{fx[0]['kind']},{fx[0]['trait']},{fx[0]['amount']}"
            + "},{" + f"{fx[1]['kind']},{fx[1]['trait']},{fx[1]['amount']}" + "}}, "
            + f"{e['min_cycle']},{e['group']},{e['chain']},{e['duration']},{e['target']},"
            + f"{e['min_response']},{e['required_trait']},{e['type_mask']},{e['min_active']},{e['min_dead']},"
            + f"{e['mitigate']},{e['branch']},{e['branch_trait']},{e['next_true']},{e['next_false']} " + "},"
        )
    rows.extend(["};", ""])
    return "\n".join(rows)


def effect_text(event: dict) -> str:
    labels = {1: "spread", 2: "air travel", 3: "sea travel", 4: "bird migration",
              5: "discovery pressure", 6: "cure research", 7: "air routes blocked",
              8: "sea routes blocked"}
    parts = []
    for effect in event["effect"]:
        kind, amount, trait = effect["kind"], effect["amount"], effect["trait"]
        if not kind:
            continue
        if kind in (7, 8):
            parts.append(labels[kind])
            continue
        label = labels[kind]
        if kind == 1 and trait != NONE:
            label = f"{TRAITS[trait]} spread"
        parts.append(f"{label} {amount:+d}%")
    if event["mitigate"] != NONE:
        parts.append("percentage effects halved by " + TRAITS[event["mitigate"]])
    return "; ".join(parts)


def eligibility_text(event: dict) -> str:
    pieces = [f"cycle {event['min_cycle']}+", TARGETS[event["target"]],
              f"response {('undetected', 'discovered', 'research', 'escalating')[event['min_response']]}+"]
    mask = event["type_mask"]
    if mask != 7:
        types = [name for bit, name in ((1, "bacteria"), (2, "virus"), (4, "fungus")) if mask & bit]
        pieces.append("type: " + "/".join(types))
    if event["min_active"]:
        pieces.append(f"active >= {event['min_active']}%")
    if event["min_dead"]:
        pieces.append(f"dead >= {event['min_dead']}%")
    if event["required_trait"] != NONE:
        pieces.append("owns " + TRAITS[event["required_trait"]])
    return ", ".join(pieces)


def branch_text(event: dict) -> str:
    branch = event["branch"]
    if branch == 1:
        return "owns " + TRAITS[event["branch_trait"]]
    return BRANCHES[branch]


def md_cell(value: str) -> str:
    return value.replace("|", "\\|").replace("\n", " ")


def render_docs(events: list[dict]) -> str:
    out = [
        "# World Events Catalog", "",
        "This reference is generated from data/events.json. The calculator compiles the checked-in C table; normal builds do not run Python.", "",
        "Events begin after the 24-cycle opening grace period. Standalone events last 8, 16, or 24 cycles; storyline stages last 16 cycles. Each event ID can occur once per run. A chain keeps its selected region throughout its selected path of four stages, and its two outcomes join at the aftermath.", "",
        "Spread, travel, and migration modifiers stack additively and are bounded to 50–150% of the normal value. Regional discovery/research contributions are weighted by regional land. Discovery and research modifiers are bounded to 75–125%. Zero baseline transmission remains zero. Route closures are temporary and do not reopen a permanent closure; human travel restrictions do not block bird migration.", "",
        "Trait gate means the disease must own that trait to start the event. Target describes the region filter used for selection. In a storyline, the onset chooses a region and subsequent stages retain it. Research effects apply once cure research has begun; Discovery effects apply before detection.", "",
        "## Standalone events", "",
        "The first 100 entries are ten events in each topic.", "",
        "| ID | Topic | Headline | Explanation | Start eligibility | Duration | Effect |",
        "|---:|---|---|---|---|---:|---|",
    ]
    for e in events[:100]:
        out.append("| " + " | ".join(map(md_cell, [str(e["id"]), GROUPS[e["group"]], e["name"],
                    e["description"], eligibility_text(e), str(e["duration"]), effect_text(e)])) + " |")
    out.extend(["", "## Storylines", ""])
    for chain in range(20):
        root = 100 + chain * 5
        stages = events[root:root + 5]
        out.extend([f"### {STORYLINES[chain]}", "",
                    f"The onset uses: {eligibility_text(stages[0])}. The escalation branches when {branch_text(stages[1])}; both outcomes lead to the aftermath.", "",
                    "| ID | Stage | Headline | Explanation | Duration | Effect | Next |",
                    "|---:|---|---|---|---:|---|---|"])
        stage_names = ["Onset", "Escalation", "Outcome A", "Outcome B", "Aftermath"]
        for n, e in enumerate(stages):
            if e["next_true"] == NONE:
                next_text = "Ends" if e["next_false"] == NONE else str(e["next_false"])
            elif n == 1:
                next_text = f"{e['next_true']} / {e['next_false']}"
            else:
                next_text = str(e["next_true"])
            out.append("| " + " | ".join(map(md_cell, [str(e["id"]), stage_names[n], e["name"],
                        e["description"], str(e["duration"]), effect_text(e), next_text])) + " |")
        out.append("")
    out.extend([
        "## Effect and branch codes", "",
        "Effects are percentages of the named baseline unless the entry says a route is blocked. A spread effect with a transmission trait applies only to that trait's existing regional contribution; the available roots are Air I, Water I, Livestock I, Rodents I, Insects I, and Blood I. Bird migration has no local spread bonus.", "",
        "The branch tests are: trait ownership; severity at least 20; deaths at least 25% in the selected region; active cases at least 50% in the selected region; cure at least 50%; or an escalating public response. Storylines use an explicit test at the escalation stage.", "",
        "Only Genetic Reshuffle I or II can delay the unresolved Patient Zero investigation; each newly used reshuffle adds 16 cycles while the first two stages are active.", "",
        "## Save compatibility", "",
        "Event state is stored separately from the event definitions. A catalog edit changes authored content but does not require Python at calculator build time. Save-format migration and calculator artifact size are documented with the save implementation.", "",
    ])
    return "\n".join(out)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="validate catalog and fail if generated files are stale")
    args = parser.parse_args()
    try:
        events = json.loads(DATA.read_text(encoding="utf-8"))
        validate(events)
        generated = ((C_OUT, render_c(events)), (DOC_OUT, render_docs(events)))
        if args.check:
            stale = [str(path.relative_to(ROOT)) for path, content in generated
                     if not path.exists() or path.read_text(encoding="utf-8") != content]
            if stale:
                print("generated event files are stale: " + ", ".join(stale), file=sys.stderr)
                return 1
            print(f"validated {EVENT_COUNT} events; generated files are current")
            return 0
        for path, content in generated:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
        print(f"validated and generated {EVENT_COUNT} events")
        return 0
    except (OSError, json.JSONDecodeError, ValueError) as exc:
        print(f"event catalog: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
