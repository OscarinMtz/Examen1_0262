import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar consistente con el Inicio
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundColor: Colors.black12, child: Icon(Icons.flash_on, color: Colors.black)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _navText(context, 'HOME', '/'),
            _navText(context, 'ABOUT', '/pantalla3'),
            _navText(context, 'CONTACT', '/pantalla3'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // 1. IMAGEN PRINCIPAL (Caja superior con X)
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.network('https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=600', fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),

            // 2. HIGHLIGHT #1 (Imagen izquierda, texto derecha)
            _buildHighlight(
              'HIGHLIGHT #1',
              'Los mejores periféricos seleccionados por Oscar Martinez para el grupo 6J.',
              'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=300',
              imageOnLeft: true,
            ),

            // 3. HIGHLIGHT #2 (Texto izquierda, imagen derecha)
            _buildHighlight(
              'HIGHLIGHT #2',
              'Tecnología de punta con envío inmediato en todo Juárez.',
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300',
              imageOnLeft: false,
            ),

            // 4. HIGHLIGHT #3 (Imagen izquierda, texto derecha)
            _buildHighlight(
              'HIGHLIGHT #3',
              'Garantía extendida y soporte técnico especializado.',
              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300',
              imageOnLeft: true,
            ),

            const SizedBox(height: 10),

            // 5. DETAILS (Caja de texto grande abajo)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: const Center(
                child: Text(
                  'DETAILS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2),
                ),
              ),
            ),
            
            const SizedBox(height: 20),

            // FOOTER (Igual al inicio para mantener consistencia)
            const Text('ELECTRO', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook, size: 18),
                SizedBox(width: 15),
                Icon(Icons.camera_alt, size: 18),
                SizedBox(width: 15),
                Icon(Icons.language, size: 18),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para crear las filas de Highlights en zigzag
  Widget _buildHighlight(String title, String desc, String url, {required bool imageOnLeft}) {
    Widget imageBox = Container(
      width: 140,
      height: 90,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Image.network(url, fit: BoxFit.cover),
    );

    Widget textBox = Expanded(
      child: Column(
        crossAxisAlignment: imageOnLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(desc, textAlign: imageOnLeft ? TextAlign.left : TextAlign.right, style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: const Text('CTA', style: TextStyle(fontSize: 10)),
          )
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: imageOnLeft ? [imageBox, const SizedBox(width: 15), textBox] : [textBox, const SizedBox(width: 15), imageBox],
      ),
    );
  }

  Widget _navText(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}