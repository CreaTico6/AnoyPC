# AnoyingPC 🎭 – The Art of Digital Disruption

A minimalist and robust Windows prank application designed to display random, credible fake system error messages. It's the perfect tool for executing a harmless yet unsettling practical joke on friends or colleagues.

---

## ⚡ TL;DR (Quick Start)

1.  **Download** `anoy_setup.bat`.
2.  **Run as Administrator** (Right-click > *Run as administrator*).
3.  **Chaos is ON** (Errors appear every 5 minutes).

### Control & Removal

The setup creates an `anoypc` folder with three batch files:

* **`kaosoff.bat`**: Stops the errors temporarily.
* **`kaosdel.bat`**: **Removes the Scheduled Task AND deletes the `anoypc` folder.** (Total Cleanup)

---

## ⚠️ Disclaimer

This is a **prank application** intended strictly for entertainment purposes. All **11 error messages are completely fake** and do not indicate any real system issues, modifications, or data loss. Use responsibly, ethically, and only on computers where you have explicit permission. The authors are not responsible for any misuse of this software.

---

## ✨ Core Features & Technical Sophistication

The `AnoyingPC` package is engineered for simplicity of deployment and comprehensive control:

* **Monolithic Setup:** A single Batch file (`anoy_setup.bat`) handles the complete installation, file generation, and system configuration.
* **Diverse Deception:** Generates one of **11 different**, carefully crafted fake English error messages for maximum believability.
* **Realistic Interface:** Messages are displayed using native Windows Message Boxes with the critical error icon.
* **Scheduled Chaos:** Configured as a scheduled task (`AnoyPC`) to run stealthily every 5 minutes.
* **Total Control:** Dedicated scripts for activation, temporary suspension, and complete removal.
* **Clean Uninstallation:** The provided utility guarantees the removal of the scheduled task AND the deletion of the entire installation directory, leaving zero trace behind.

## 📋 Requirements

* Windows Operating System (7, 8, 10, or 11)
* **Administrator Privileges** (required to create and manage the Windows Scheduled Task).

---

## 🚀 Installation & Usage (The Chaos Guide)

The entire setup process is condensed into a single, automated step.

1.  Download the **`anoy_setup.bat`** file.
2.  Run **`anoy_setup.bat`** as **Administrator** (Right-click > *Run as administrator*).
3.  The script will automatically create the dedicated `anoypc` folder, generate all necessary files (VBScript and control scripts), and enable the scheduled task to start the chaos.

### Post-Installation Control Scripts

The `anoypc` directory, created by the setup file, contains everything needed for operation and control:

| File | Primary Action | Purpose |
| :--- | :--- | :--- |
| **`kaosoff.bat`** | DISABLE | Temporarily disables the scheduled task, restoring silence to the system. |
| **`kaoson.bat`** | ENABLE | Re-enables the `AnoyPC` Scheduled Task to resume displaying errors. |
| **`kaosdel.bat`** | **REMOVE** | **Complete Uninstallation.** Deletes the Scheduled Task AND removes the entire `anoypc` folder and its contents. |

***Note:** All control files must be run with Administrator privileges.*

---

## 📁 Repository Structure

The distribution package focuses on the core automation files:

* **`anoy_setup.bat`**: The master installer responsible for generating all components.
* **`README.md`**: This document.

The operational files (`anoypc.vbs`, `kaoson.bat`, `kaosoff.bat`, `kaosdel.bat`) are generated dynamically upon running `anoy_setup.bat`.
