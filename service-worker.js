// service-worker.js

chrome.runtime.onInstalled.addListener(() => {
    console.log('Estude Comigo foi instalado!');
  });
  
  // Listener para capturar eventos de abas ou mudanças
  chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {

    if (changeInfo.status === 'complete') {
      // chrome.scripting.executeScript({
      //   target: { tabId: tabId },
      //   files: ['popup.js']
      // });
    }
  });
  