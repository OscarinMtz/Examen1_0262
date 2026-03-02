import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    // Estilo de texto común para las declaraciones sobre imágenes
    const TextStyle statementTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      shadows: [
        Shadow(
          blurRadius: 3.0,
          color: Colors.black,
          offset: Offset(1.0, 1.0),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(Icons.flash_on, color: Colors.black),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _navText(context, 'HOME', '/'),
            _navText(context, 'PRODUCT', '/pantalla2'),
            _navText(context, 'CONTACT', '/pantalla3'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. SHORT STATEMENT ABOUT THE TEAM (CON IMAGEN DE FONDO)
            Container(
              width: double.infinity,
              height: 150, // Altura para que se aprecie la imagen
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                image: const DecorationImage(
                  // Imagen de fondo para el statement del equipo
                  image: NetworkImage('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=600'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SHORT STATEMENT ABOUT THE TEAM',
                      style: statementTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'En ELECTRO, el equipo liderado por Oscar Martinez trabaja para ofrecerte lo mejor del grupo 6J.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 25),

            // 2. THE TEAM
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('THE TEAM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2.5,
                children: [
                  _buildTeamMember('Oscar M.', 'CEO', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100'),
                  _buildTeamMember('Luis R.', 'Ventas', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100'),
                  _buildTeamMember('Ana G.', 'Soporte', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100'),
                  _buildTeamMember('Staff 6J', 'Dev', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 3. SHORT STATEMENT ABOUT THE COMPANY (CON IMAGEN DE FONDO)
            // 3. SHORT STATEMENT ABOUT THE COMPANY (CORREGIDO CON IMAGEN VISIBLE)
Container(
  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
  width: double.infinity,
  height: 180, // Altura fija para asegurar que se vea la imagen
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),
  ),
  child: Stack(
    children: [
      // La imagen de fondo
      Positioned.fill(
        child: Image.network(
          'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600', 
          fit: BoxFit.cover,
        ),
      ),
      // Capa oscura para que el texto resalte
      Positioned.fill(
        child: Container(color: Colors.black.withOpacity(0.4)),
      ),
      // El texto encima
      const Center(
        child: Text(
          'SHORT STATEMENT ABOUT THE COMPANY',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            shadows: [Shadow(blurRadius: 10, color: Colors.black)],
          ),
        ),
      ),
    ],
  ),
),
            
            const SizedBox(height: 25),

            // 4. HISTORY / MISSIONS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('HISTORY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      'Fundada en 2026, ELECTRO nació como un proyecto escolar de Oscar Martinez para revolucionar el mercado local.',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Nuestra misión en el grupo 6J es democratizar el acceso a hardware de alta gama con soporte personalizado.',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // FOOTER SOCIAL
            const Text('ELECTRO', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook, size: 24, color: Colors.black87),
                SizedBox(width: 20),
                Icon(Icons.camera_alt, size: 24, color: Colors.black87),
                SizedBox(width: 20),
                Icon(Icons.language, size: 24, color: Colors.black87),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para cada miembro del equipo
  Widget _buildTeamMember(String name, String role, String url) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle, // Forma circular para variar un poco
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
            Text(role, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _navText(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}