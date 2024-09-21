// service-worker.js
const SAGAH = 'https://iesb.grupoa.education/';
chrome.runtime.onInstalled.addListener(() => {
  console.log('Estude Comigo foi instalado!');
});
// Listener para capturar eventos de abas ou mudanças
chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {
  if (tab.url.startsWith(SAGAH)) {
    chrome.scripting.executeScript({
      target: { tabId: tabId },
      files: ['popup.js']
    });
  }
});
