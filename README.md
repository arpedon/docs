# Arpedon Documentation

Πως να συνεισφέρετε:

Θα χρειαστούν στον υπολογιστή:

- python 3.7
- pipenv
- Επεξεργαστής κειμένου. Προτείνεται Visual Studio code

## Σε υπολογιστή Windows

Την πρώτη φορά για να εγκαταστήσουμε τον κώδικα και τα εργαλεία.

### 1. Clone project

Μέσω Powershell πηγαίνουμε στο path οπου βρίσκονται τα project μας.

Κατεβάζουμε τον κώδικα του αποθετηρίου:

```
git clone git@github.com:arpedon/docs.git; cd docs
```

### 2. Install tools

```
pipenv install
```

Κάθε επόμενη φορά τα παραπάνω βήματα παραλείπονται.


## 3. Ξεκινώντας να γράφουμε

Ανοίγουμε το vscode και στο Terminal εκτελούμε τις παρακάτω εντολές.

```
pipenv shell
cd docs
```

Πρέπει να είμαστε στο φάκελο `./docs/docs` του project και το εικονικό περιβάλλον python να είναι ενεργοποιημένο.

## 4. Build των docs στα Ελληνικά

Windows (Powershell):  

```powershell
Set-Item env:SPHINXOPTS "-D language=el"; .\make.bat html
```

Τα δημιουργημένα αρχεία ειναι στο φάκελο `_build`. Πηγαίνοντας στο φάκελο αυτό ανοίγουμε το `index.html` και βλέπουμε το αποτέλεσμα.

## 5. Δημιουργία των απαιτούμενων αρχείων για μετάφραση στα Αγγλικά

Windows (Powershell): 

```powershell
sphinx-build -b gettext . _build/gettext; sphinx-intl update -p _build/gettext -l en
```

Τώρα τα αρχεία `.po` είναι στο .`/locale/en/LC_MESSAGES/`

## 6. Δημιουργία της μετάφρασης

Windows (Powershell): 

```powershell
Set-Item env:SPHINXOPTS "-D language=en"; .\make.bat html
```

Πλέον στο φάκελο `_build` τα αρχεία έχουν αντικατασταθεί με την Αγγλική έκδοση.
