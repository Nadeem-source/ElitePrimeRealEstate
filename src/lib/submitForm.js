/// <reference types="vite/client" />
export const submitToGoogleSheets = async (data, sheetName) => {
  const scriptURL = import.meta.env.VITE_GOOGLE_SCRIPT_URL;
  if (!scriptURL) {
    console.warn("VITE_GOOGLE_SCRIPT_URL is not set. Simulating success.");
    return new Promise(resolve => setTimeout(resolve, 1500));
  }

  const formData = new FormData();
  Object.keys(data).forEach(key => {
    formData.append(key, data[key]);
  });
  formData.append('sheetName', sheetName);

  try {
    const response = await fetch(scriptURL, {
      method: 'POST',
      body: formData,
    });
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return await response.json();
  } catch (error) {
    console.error('Error submitting form', error);
    throw error;
  }
};
