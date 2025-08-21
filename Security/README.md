# Security Project

This repository contains the files for the "Security Project," a course project for the MSc in Applied Informatics at Charokopio University. The project focuses on an analysis of cryptographic algorithms and digital signature schemes.

## Files

* `ap23011_security.ipynb`: A Jupyter Notebook containing the Python code for the project. The code includes implementations and comparisons of:
    * **Cryptographic Algorithms:** Fernet, ChaCha20Poly1305, and AES-GCM.
    * **Digital Signature Schemes:** DSA, RSA, and Ed25519.
* `ap23011_Security_Report.pdf`: A comprehensive report that details the methodology, analyzes the results, and provides a summary of the findings from the Jupyter Notebook.

## Project Overview

The project is divided into two main parts:

**Report a:** Compares the performance and characteristics of different symmetric encryption algorithms and Message Authentication Code (MAC) algorithms. Key findings from the analysis include:
* The size of the encrypted data is larger with **Fernet** due to the addition of metadata, while **ChaCha20Poly1305** and **AES-GCM** produce the same size output by adding a 16-byte authentication tag.
* **Fernet** had the slowest performance, as it requires extra time to add metadata.
* The **HMAC** algorithm produces a 32-byte tag, while **CMAC** and **Poly1305** both create 16-byte tags.

**Report b:** Provides an analysis of a digital certificate, detailing its key attributes, such as the issuer, signature algorithm, public key, and validity dates.

## How to Run the Code

To run the Jupyter Notebook (`ap23011_security.ipynb`), you can use a local Python environment with Jupyter installed or a cloud-based service like Google Colab or Binder.

**Recommended Libraries:**
To replicate the environment used to create this project, you will need to install the `cryptography` library.

```bash
pip install cryptography
```
