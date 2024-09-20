// popup.js

document.addEventListener('DOMContentLoaded', function () {
  const recordButton = document.querySelector('.record-button');
  const audioPlayer = document.getElementById('audio-player');
  const studentsList = document.getElementById('students-list');

  recordButton.addEventListener('click', function () {
    // Lógica para iniciar a gravação de áudio
    console.log('Gravação iniciada');

    // Aqui você pode adicionar a integração com WebRTC para gravar o áudio.
    // Adicione Firebase ou a lógica para armazenar o áudio gravado.
  });
  // Função para manipular o envio do áudio gravado para o Firebase
  function uploadAudio(audioBlob) {
    // Upload para Firebase usando storage ou Firestore
    console.log('Áudio sendo enviado...');
  }

  // Função para carregar o arquivo JSON
  function loadStudentAudios() {
    fetch('students.json')
      .then(response => response.json())
      .then(data => {
        const students = data.students;
        students.forEach(student => {
          const listItem = document.createElement('li');
          listItem.textContent = `${student.name} - ${student.username} (${student.duration})`;
          listItem.addEventListener('click', () => {
            audioPlayer.src = student.audioUrl;  // Atualiza o player com o áudio selecionado
            audioPlayer.play();                  // Reproduz o áudio automaticamente
          });
          studentsList.appendChild(listItem);
        });
      })
      .catch(error => console.error('Erro ao carregar o JSON:', error));
  }

  // Carrega os dados dos alunos e seus áudios
  loadStudentAudios();
});
