# Arpedon Documentation

How to contribute:

## 1. Clone project

```
git clone git@github.com:arpedon/docs.git; cd docs
```

## 2. Install tools

```
pipenv install
```

## 3. Use the pipenv shell

```
pipenv shell
cd docs
```

You are now in the `./docs/docs` directory.

## 4. Build documentation in Greek

Windows (Powershell):  

```powershell
Set-Item env:SPHINXOPTS "-D language=el"; .\make.bat html
```

Linux (bash): 

```bash
make -e SPHINXOPTS="-D language='el'" html
```

The generated files are in the `_build` directory. You can visit `index.html`.

## 5. Generate files for translations to English

Windows (Powershell): 

```powershell
sphinx-build -b gettext . _build/gettext; sphinx-intl update -p _build/gettext -l en
```

Linux (bash): 

```bash
sphinx-build -b gettext . _build/gettext && sphinx-intl update -p _build/gettext -l en
```

Now the `.po` files are in .`/locale/en/LC_MESSAGES/`

## 6. Generate English version

Windows (Powershell): 

```powershell
Set-Item env:SPHINXOPTS "-D language=en"; .\make.bat html
```

Linux (bash): 

```bash
make -e SPHINXOPTS="-D language='en'" html
```
