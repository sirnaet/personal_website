# Google Sheets Contact Form Setup

This Flutter form submits to a Google Apps Script web app that writes into Google Sheets.

On Flutter Web, the app uses a hidden browser form submission instead of `fetch`/`http` to avoid Google Apps Script CORS issues.

The submitted fields are:

```json
{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "message": "Hello there",
  "timestamp": "2026-03-27T12:34:56.000Z"
}
```

## 1. Create the sheet

Create a Google Sheet with these headers on row 1:

```text
Name | Email | Message | Timestamp
```

## 2. Add the Apps Script

Open `Extensions -> Apps Script` and paste this:

```javascript
const SHEET_NAME = 'Contact Forms';

function doPost(e) {
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName(SHEET_NAME);
  const data = getPayload_(e);

  sheet.appendRow([
    data.name || '',
    data.email || '',
    data.message || '',
    data.timestamp || new Date().toISOString(),
  ]);

  return ContentService
    .createTextOutput(JSON.stringify({ ok: true }))
    .setMimeType(ContentService.MimeType.JSON);
}

function getPayload_(e) {
  const type = e.postData && e.postData.type ? e.postData.type : '';

  if (type.indexOf('application/json') !== -1) {
    return JSON.parse(e.postData.contents || '{}');
  }

  return {
    name: e.parameter.name || '',
    email: e.parameter.email || '',
    message: e.parameter.message || '',
    timestamp: e.parameter.timestamp || new Date().toISOString(),
  };
}
```

## 3. Deploy it

Deploy as a web app:

- Execute as: `Me`
- Who has access: `Anyone`

Copy the web app URL.

## 4. Current endpoint

The app is currently wired to this deployed Apps Script URL by default:

```text
https://script.google.com/macros/s/AKfycbxUhN6EBrjzBQvzRrfifFaCF4IJ8O3oTxilxxAiIon_nQDIMVDBtEv6niNDQS_jLcqK/exec
```

## 5. Override the endpoint if needed

Use `--dart-define` if you want to replace the default endpoint:

```bash
flutter run -d chrome --dart-define=CONTACT_FORM_ENDPOINT=https://script.google.com/macros/s/YOUR_DEPLOYMENT_ID/exec
```

For a production build:

```bash
flutter build web --dart-define=CONTACT_FORM_ENDPOINT=https://script.google.com/macros/s/YOUR_DEPLOYMENT_ID/exec
```

## Notes

- If you replace the Apps Script deployment later, either update the default URL in [contact_form_service.dart](/home/sirnaet/personal_website/lib/services/contact_form_service.dart) or pass the new URL with `--dart-define`.
- If Google Apps Script changes, redeploy and update the URL.
- For Flutter Web, this setup avoids normal CORS issues by using a hidden form post.
