# quickNotes

quickNotes is a web application for creating and managing notes efficiently. It uses Next.js for the frontend and Django for the backend.

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
