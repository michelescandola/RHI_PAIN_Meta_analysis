#  RHI_PAIN_Meta_analysis

[![Open Science](https://img.shields.io/badge/Open%20Science-%E2%9C%94-blue)](https://osf.io/db4cf)
[![Made with R](https://img.shields.io/badge/Made%20with-R-blue?logo=r&logoColor=white)](https://www.r-project.org/)
[![OSF Project](https://img.shields.io/badge/OSF-Project-lightgrey)](https://osf.io/db4cf)
[![Pre-registration](https://img.shields.io/badge/OSF-Pre--registration-yellow)](https://osf.io/4vxs6)

R code for a **systematic review** and **meta-analysis** exploring how the *Rubber Hand Illusion* (RHI) influences pain perception — with a commitment to **open, transparent, and reproducible science**.

---

## Project Overview

Does the *Rubber Hand Illusion* reduce pain, increase it, or have no effect at all?  
The literature is surprisingly mixed — some studies report hypoalgesia, others hyperalgesia, and some no change.

We believe part of the answer lies in study design.  
Since merely looking at one’s body can sometimes reduce pain, we hypothesize that a similar mechanism may underlie RHI effects.  

To address these inconsistencies, we will:

- **Systematically review** all available studies on RHI and pain perception.
- **Meta-analyze** their effects.
- **Evaluate methodological transparency** using our *Transparency Of Methods* (TOM) checklist.
- Explore whether higher bias is associated with lower transparency.

This project is **fully pre-registered**, and all code/data are shared here for open verification and reuse.

---

## Contributors

- Michele Scandola  (michele.scandola@univr.it)
- Marco Lezcano     (marco.lezcano@univr.it)
- Francesca Santoni  (santonifrancesca1994@yahoo.it)

---

## 📄 Pre-registration

[OSF pre-registration](https://osf.io/4vxs6)

---

## OSF Repository

[OSF project page](https://osf.io/db4cf)

---

## File Structure

### **Main folder**
| File | Description |
|------|-------------|
| `remove_duplicates.R` | Script for duplicate search and removal |
| `title_abstract_selection.R` | Script for title and abstract screening |
| `full_text_selection.R` | Script for full-text screening |

---

### **Data folder**
| File | Description |
|------|-------------|
| `Psycinfo RHI.ris` | Dataset from PsycINFO |
| `pubmed-Rubberhand-set.ris` | Dataset from PubMed |
| `biblio_no_duplicates.bib` | Dataset without duplicates (auto), BibTeX format |
| `data_no_duplicates.csv` | Dataset without duplicates (auto), CSV format |
| `data_no_duplicates_manual.csv` | Dataset without duplicates (manual), CSV format |
| `ML.csv` | Title/abstract selections by ML |
| `FS.csv` | Title/abstract selections by FS |
| `first_stage.csv` | Combined ML + FS selections |
| `selected.csv` | Final selection after first stage |
| `title_abstract_inc.csv` | Conflicting selections resolved by MS |
| `full_paper_FS.csv` | Full-text selections by FS |
| `full_paper_ML.csv` | Full-text selections by ML |
| `full_paper_FS_comma.csv` | FS full-text selections (CSV standard format) |
| `full_paper_ML_comma.csv` | ML full-text selections (CSV standard format) |
| `second_stage.csv` | Combined full-text selection datasets |
| `full_text_selected.csv` | Final full-text selections |
| `full_text_inc.csv` | Conflicting full-text selections resolved by MS |

---

## License & Reuse

All code and data are shared under the MIT License to encourage **replication, reanalysis, and educational use**.  
Please cite this repository if you use it in your own research.

---

## Notes

1. **2025-04-09** – Duplicate search conducted both automatically and manually; both methods yielded identical results.  
2. **2025-05-27** – Title and abstract selection completed.  
3. **2025-08-12** – Full-text selection completed.  

---

> *Science works best when it’s transparent. This repository is our contribution to making pain research in the context of RHI clearer, reproducible, and ready for collaborative exploration.*
