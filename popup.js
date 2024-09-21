document.addEventListener('DOMContentLoaded', function () {
  const recordButton = document.querySelector('.record-button');
  const audioPlayer = document.getElementById('audio-player');
  const studentsList = document.getElementById('students-list');
  
  let isRecording = false;
  let mockRecordedAudio = null; // Variável para armazenar a gravação simulada

  // Função para simular a gravação de áudio
  recordButton.addEventListener('click', function () {
    if (!isRecording) {
      console.log('Gravação iniciada');
      isRecording = true;
      
      // Simulação: após 3 segundos, gerar um áudio fictício
      setTimeout(() => {
        console.log('Gravação finalizada');
        mockRecordedAudio = 'https://www.example.com/mocked_audio.mp3'; // Simulação de um link de áudio gravado
        isRecording = false;
        
        // Simular envio para o Firebase
        uploadAudio(mockRecordedAudio);
      }, 3000); // Simula 3 segundos de gravação

    } else {
      console.log('Já estamos gravando, por favor, aguarde...');
    }
  });

  // Função para manipular o envio do áudio gravado (simulado)
  function uploadAudio(audioBlob) {
    // Aqui você pode simular um upload para o Firebase
    console.log('Áudio sendo enviado... Simulação de upload para Firebase concluída.');

    // Após o envio simulado, podemos adicionar o áudio gravado à lista de áudios (opcional)
    const newStudent = {
      name: "Você (Gravação)",
      username: "@voce_gravacao",
      audioUrl: audioBlob,
      duration: "03:00" // Simular uma duração de 3 minutos
    };

    addStudentToList(newStudent);
  }

  // Função para adicionar novos alunos dinamicamente à lista
  function addStudentToList(student) {
    const listItem = document.createElement('li');
    listItem.textContent = `${student.name} - ${student.username} (${student.duration})`;
    listItem.addEventListener('click', () => {
      audioPlayer.src = student.audioUrl;  // Atualiza o player com o áudio selecionado
      audioPlayer.play();                  // Reproduz o áudio automaticamente
    });
    studentsList.appendChild(listItem);
  }

  // Função para carregar o arquivo JSON com a lista de alunos
  function loadStudentAudios() {
    fetch('students.json')
      .then(response => response.json())
      .then(data => {
        const students = data.students;
        students.forEach(student => addStudentToList(student));
      })
      .catch(error => console.error('Erro ao carregar o JSON:', error));
  }

  // Carrega os dados dos alunos e seus áudios
  loadStudentAudios();
});
