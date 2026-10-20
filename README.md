# Modern Dashboard UI (Qt/QML)

> A visually rich, responsive dashboard application built with Qt Quick (QML) and C++, featuring dynamic navigation, custom theming, and data visualization.

## 📖 Overview

**Dashboard** is a modern UI/UX desktop application built using the Qt framework. It provides a highly modular and visually appealing dashboard interface, complete with a custom sidebar navigation system. The application is designed to display various metrics, reports, and settings using distinct QML views managed via a `StackView`. It heavily focuses on clean design, custom fonts, and centralized theming.

## ✨ Features (Verified from source)

- **Dynamic Navigation:** Seamless page switching using QML's `StackView` without reloading the main window.
- **Data Visualization:** Integrated with **Qt Charts** for rendering graphs and data metrics.
- **Custom Theming:** Centralized color palette and button styles (`PurpleTheme`, `Colors.qml`, `ButtonStyle.qml`).
- **Multiple Dashboard Views:** Includes four distinct dashboard layouts (`Dashboard1` to `Dashboard4`), a Reports page, and a Settings page.
- **Custom Typography:** Utilizes a bundled custom variable font (`FamiljenGrotesk`) via `FontLoader` for a unique, modern aesthetic.
- **Modular Component Architecture:** Reusable QML components separated into a dedicated `component` folder.

## 🧱 Architecture

The project follows a modular QML-centric architecture, separating views, themes, and components:

| Layer | Components | Responsibility |
|-------|-----------|----------------|
| **Entry Point** | `main.cpp` | Initializes the Qt QML engine. |
| **Main Layout** | `main.qml` | Contains the sidebar, `StackView` router, and global layout. |
| **Views (Pages)** | `Dashboard1-4.qml`, `ReportsPage.qml`, `SettingsPage.qml` | Individual pages loaded dynamically into the `StackView`. |
| **Theming** | `themes/` (`PurpleTheme.qml`, `Colors.qml`) | Centralized color variables and styles. |
| **Components** | `component/` (`ButtonStyle.qml`) | Reusable, styled UI controls. |
| **Assets & Models** | `fonts/`, `images/`, `sample/`, `Model/` | Custom fonts, images, sample data, and data models. |

> **Note:** The application uses **qmake** (`dashboard.pro`) and requires the **Qt Charts** module for data visualization. Navigation is handled via `stackView.replace(...)` for a flat hierarchy.

## 🛠️ Tech Stack

- **Language:** C++ & QML
- **UI Framework:** Qt Quick (Qt 5.12+ / Qt 6)
- **Modules:** Qt Quick, Qt Quick Controls 2, **Qt Charts**
- **Build System:** qmake
- **Design System:** Custom Theming & Typography

## 🚀 Getting Started

### Prerequisites
- Qt 5.15 or Qt 6.x (with Qt Quick, Qt Quick Controls, and **Qt Charts** modules)
- C++ Compiler (MSVC, MinGW, or GCC)
- Qt Creator (Recommended for best QML editing experience)

### Build & Run
```bash
# Clone the repository
git clone https://github.com/mokhtarizahra/Dashboard.git
cd Dashboard

# Build using qmake
qmake dashboard.pro
make      # (or nmake / mingw32-make on Windows)

# Run the application
./dashboard # or dashboard.exe on Windows
📂 Project Structure
text
Dashboard/
├── main.cpp                 # Application entry point
├── main.qml                 # Main window, sidebar layout & StackView
├── dashboard.pro            # qmake configuration (includes QT += charts)
├── qml.qrc                  # QML resources
│
├── component/               # Reusable UI components
│   └── ButtonStyle.qml      # Custom styled button
│
├── themes/                  # Theming files
│   ├── Colors.qml           # Color palette definitions
│   └── PurpleTheme.qml      # Main theme configuration
│
├── Views (Pages)/
│   ├── Dashboard1.qml       # Dashboard view 1
│   ├── Dashboard2.qml       # Dashboard view 2
│   ├── Dashboard3.qml       # Dashboard view 3
│   ├── Dashboard4.qml       # Dashboard view 4 (Default initial view)
│   ├── ReportsPage.qml      # Reports view
│   └── SettingsPage.qml     # Settings view
│
├── Model/                   # Data models/logic
├── fonts/                   # Custom fonts (e.g., FamiljenGrotesk)
├── images/                  # Application icons and images
└── sample/                  # Sample images/data
👤 Author
Zahra Mokhtari
GitHub: @mokhtarizahra

📄 License
This project is provided under the terms included in the LICENSE file.
