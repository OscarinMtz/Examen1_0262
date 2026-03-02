import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Fondo blanco como en el boceto
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundColor: Colors.black12, child: Icon(Icons.flash_on, color: Colors.black)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _navText(context, 'PRODUCT', '/pantalla2'),
            _navText(context, 'ABOUT', '/pantalla3'),
            _navText(context, 'CONTACT', '/pantalla3'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. BANNER PRINCIPAL (Caja superior con X)
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.network('https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600', fit: BoxFit.cover),
            ),
            
            const SizedBox(height: 20),

            // 2. PRODUCTO #1 (Imagen + Texto + Botón CTA)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160, height: 130,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.network('https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=300', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PRODUCT #1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 5),
                        const Text('Calidad premium garantizada por Oscar Martinez y el equipo 6J.'),
                        const SizedBox(height: 10),
                        // BOTÓN CTA "GO" del boceto
                        OutlinedButton(
                          onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black), minimumSize: const Size(60, 30)),
                          child: const Text('GO', style: TextStyle(color: Colors.black, fontSize: 12)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

// 3. PRODUCT DESCRIPTION (Caja con imagen de fondo y botón funcional)
Container(
  margin: const EdgeInsets.all(10),
  width: double.infinity,
  height: 160,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
    image: const DecorationImage(
      image: NetworkImage('https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=600'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'PRODUCT DESCRIPTION', 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 18,
        )
      ),
      const SizedBox(height: 15),
      // BOTÓN "GO" AHORA FUNCIONAL
      OutlinedButton(
        onPressed: () {
          // Esta línea hace que el botón te lleve a la Pantalla 2 (Our Product)
          Navigator.pushNamed(context, '/pantalla2'); 
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Para que se vea como en tu dibujo
          ),
        ),
        child: const Text(
          'GO', 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
      ),
    ],
  ),
),

            const SizedBox(height: 10),

            // 4. ABOUT US (Dos columnas de texto)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ABOUT US', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(child: Text('ELECTRO es líder en Juárez, ofreciendo tecnología de punta con el respaldo de Oscar Martinez.')),
                      SizedBox(width: 10),
                      Expanded(child: Text('Nuestro compromiso con el grupo 6J es brindar siempre la mejor atención y garantía.')),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.black, thickness: 1.5),

            // 5. FOOTER (Iconos sociales del boceto)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Text('ELECTRO', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.facebook, size: 20),
                      SizedBox(width: 20),
                      Icon(Icons.camera_alt, size: 20),
                      SizedBox(width: 20),
                      Icon(Icons.language, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para los textos del menú superior
  Widget _navText(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}