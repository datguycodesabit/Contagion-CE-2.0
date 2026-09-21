"""Package only the native game, required libraries, instructions and notices."""
import hashlib
import os
from pathlib import Path
import zipfile

root = Path(__file__).resolve().parents[2]
libs = Path(os.environ['CE_LIBRARIES'])
files = {'CNTAGION.8xp': root / 'bin/CNTAGION.8xp',
         'TRANSFER.txt': root / 'TRANSFER.md',
         'CE-LIBRARIES-LICENSE.txt': Path(__file__).with_name('CE-LIBRARIES-LICENSE.txt')}
for name in ('libload', 'graphx', 'keypadc', 'fileioc'):
    files[name + '.8xv'] = libs / (name + '.8xv')
manifest = ''.join(f'{hashlib.sha256(p.read_bytes()).hexdigest()}  {name}\n'
                   for name, p in files.items())
output = root / 'bin/CONTAGION-CE-2.0.zip'
with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
    for name, source in files.items():
        archive.write(source, name)
    archive.writestr('SHA256SUMS.txt', manifest)
with zipfile.ZipFile(output) as archive:
    assert archive.testzip() is None
    assert set(archive.namelist()) == set(files) | {'SHA256SUMS.txt'}
    for name, source in files.items():
        assert archive.read(name) == source.read_bytes()
print(f'{output}: {output.stat().st_size} bytes, verified {len(files)} files + manifest')
