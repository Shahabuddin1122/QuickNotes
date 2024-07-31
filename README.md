# quickNotes

quickNotes is a web and mobile application for creating and managing notes efficiently. It uses Next.js for the frontend and Django for the backend and flutter for android application.

## Features

- **Notes Management**: Create, edit, delete, and organize notes.
- **Responsive Design**: Accessible on both desktop and mobile devices.

## Installation

### Prerequisites

- Node.js and npm
- Python and pip
- Virtual environment (optional but recommended)

### Frontend Setup

1. Clone the repository and navigate to the frontend directory:

   ```bash
   git clone https://github.com/Shahabuddin1122/QuickNotes.git
   cd quickNotes/frontend
   npm install
   npm run dev

### Backend Setup

1. Navigate to the backend directory:

   ```bash
   cd quickNotes/backend

2. Create a virtual environment and activate it::

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows, use `venv\Scripts\activate`

3. Install dependencies:

    ```bash
   pip install -r requirements.txt

4. Apply migrations and create a superuser:

    ```bash
   python manage.py migrate
   python manage.py createsuperuser

5. Start the development server:

    ```bash
    python manage.py runserver

### Android App Setup

1. Navigate to the quick_notes directory:

   ```bash
   cd quickNotes/quick_notes

2. Open the project in Android Studio.

3. Ensure that all necessary SDKs and dependencies are installed.

4. Configure the backend API URL in the application if needed.

5. Build and run the app on an emulator or physical device.

