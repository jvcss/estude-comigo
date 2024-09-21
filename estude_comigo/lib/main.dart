import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(EstudeComigoApp());

class EstudeComigoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Lista de imagens do carousel
  final List<String> imageList = [
    'assets/piramede_aprendizado.png',
    'assets/aprendizado_por_colaboracao.png',
    'assets/melhora_memoria.png',
    'assets/piramede_aprendizado.png',
    'assets/piramede_aprendizado.png',
  ];

  // Lista mock de canais que será populada com base na pesquisa
  List<Map<String, String>> canaisList = [];

  // Função para simular busca de canais de "programação" no YouTube
  void buscarCanais(String termo) {
    // Mock de dados para "programação"
    if (termo.toLowerCase() == 'programação') {
      setState(() {
        canaisList = [
          {
            'titulo': 'Canal do Código',
            'descricao': 'Tudo sobre programação!',
            'image': 'https://yt3.googleusercontent.com/ytc/AIdro_nLrmTeBX7lwha0L24-afjpMbDxG3zCqnntZzT64g7J5t4=s176-c-k-c0x00ffffff-no-rj-mo',
          },
          {
            'titulo': 'John Hammond',
            'descricao': 'Free Cybersecurity Education and Ethical Hacking.',
            'image': 'https://yt3.ggpht.com/6FqcWoHZvrZixaGi1S3Re3Z90SCS3iq2_36hQSnSHQPtQVVkywH8WKka53MiBYBSP6DmqM-g9w=s176-c-k-c0x00ffffff-no-rj-mo',
          },
          {
            'titulo': 'De aluno para aluno',
            'descricao': 'Tutoriais simples e eficazes.',
            'image': 'https://yt3.googleusercontent.com/ytc/AIdro_nKi7eJa5L7xWr3ML8KDEJgkv6fasg7-CI9LqeJw252j9s=s176-c-k-c0x00ffffff-no-rj-mo',
          },
          {
            'titulo': 'TechCode',
            'descricao': 'Tecnologia e código.',
            'image': 'https://yt3.googleusercontent.com/ytc/AIdro_nMEp1IukkCSu7iW26upVurEGnvm4G8fOgUPtdeJsOnag=s176-c-k-c0x00ffffff-no-rj-mo',
          },
          {
            'titulo': 'Codando com Ciência',
            'descricao': 'Ciência e programação unidas.',
            'image': 'https://yt3.ggpht.com/eWG5WO5K6OsCQGP_nNHAnERdVCS3ymF9wPvD8GJHqKNiMB5AWB_WU22YtLclxYItA5mZSFW4mw=s176-c-k-c0x00ffffff-no-rj-mo',
          },
          {
            'titulo': 'CodeMaster',
            'descricao': 'Truques e dicas para codar melhor.',
            'image': 'https://yt3.ggpht.com/2VZMMO24xcJyMZFeSm6APc1alScospwVyfVtCBcs6HWl6PKicIom5xvMCyWUNYcwuINgJl2q0fk=s176-c-k-c0x00ffffff-no-rj-mo',
          },
        ];
      });
    } else {
      // Se o termo não for "programação", exibe lista vazia
      setState(() {
        canaisList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'EXTENSÃO ESTUDE COMIGO',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de pesquisa - NÃO rolável
            TextField(
              decoration: InputDecoration(
                hintText: 'Escolha um tema para estudar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (value) {
                buscarCanais(value); // Realiza a pesquisa ao submeter o texto
              },
            ),
            const SizedBox(height: 20),

            // Conteúdo rolável
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Slider de imagens/carrossel
                    CarouselSlider(
                      options: CarouselOptions(height: 400, autoPlay: false),
                      items: imageList.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.grey[300]),
                              child: Center(
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Grid de Cards para diferentes tópicos
                    canaisList.isEmpty
                        ? const Text('Nenhum canal encontrado. Pesquise por "programação".')
                        : GridView.builder(
                            shrinkWrap: true, // Isso permite que o GridView funcione dentro do ScrollView
                            physics: const NeverScrollableScrollPhysics(), // Desabilitar o scroll no GridView
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: canaisList.length, // Quantidade de cards com base no resultado
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(canaisList[index]['image']?? ''),
                                        backgroundColor: Colors.grey[400],
                                        radius: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            canaisList[index]['titulo']!,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            canaisList[index]['descricao']!,
                                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
