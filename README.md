# Temperature Converter App

This Flutter application allows users to convert temperatures between Celsius and Fahrenheit. It features a responsive, clean user interface that works seamlessly in both portrait and landscape orientations.

---

## Purpose

The purpose of this project as per the rubtic is to demonstrate Flutter skills, including:

- **Widget management** using `StatelessWidget` and `StatefulWidget`
- **State management** using `setState`
- **Input validation**
- **Responsive UI design**
- **User feedback** through visual cues and `SnackBar`
- **Conversion history tracking**

---

## Architecture

This project uses a simple Flutter architecture which consists of:

- `main()`: The entry point of the application.
- `ConversionApp`: The root `StatelessWidget` that wraps the MaterialApp.
- `MainScreen`: A `StatefulWidget` where all logic and UI are handled.

---

## Critical Components

### 1. `TextEditingController`

Used to read, manage and store the temperature input from the user.

### 2. `ConversionType Enum`

Defines two conversion types:

- `cToF`: Celsius to Fahrenheit
- `fToC`: Fahrenheit to Celsius

### 3. `setState()`

Used for managing local state, particularly:

- Switching conversion types
- Updating result and history
- Reacting to button presses and inputs

### 4. `MediaQuery`

Determines screen orientation and adjusts layout:

- Column for portrait
- Row split for landscape

### 5. `RadioListTile`

Enables selection between conversion modes with a user-friendly radio button UI.

### 6. `SnackBar`

Displays error messages if the input is empty or invalid.

### 7. `ListView.builder`

Dynamically displays a scrollable history of conversions made by the user.

---

## Features

- Convert between Celsius and Fahrenheit
- Input validation with error messages
- Clear and intuitive UI using Material Design principles
- Responsive layout in portrait and landscape orientations
- Maintains a live conversion history
- Results accurate to two decimal places

---

## UI Design Highlights

- Uses `AppBar` with center title and customized background
- Responsive padding and spacing with `SizedBox` and `Padding`
- Styled result display with bold fonts
- Clean visual separation using `Divider`
- Consistent use of Flutter widgets like `ElevatedButton`, `TextField`, and `ListTile`

---

## How Clone the Repository

   ```bash
   git clone https://github.com/Aimee-Gloire/temp_conversion.git

   cd temp_conversion
   ```
