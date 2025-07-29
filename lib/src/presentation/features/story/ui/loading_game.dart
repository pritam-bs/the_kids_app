import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_kids_app/src/core/audio/sound_service.dart';
import 'dart:math';
import 'dart:async';

import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/haptics/haptic_service.dart';

class FallingStar {
  final Key key;
  double x;
  double y;
  double speed;
  bool isCaught;
  AnimationController caughtAnimationController;
  Animation<double> scaleAnimation;
  Animation<double> fadeAnimation;

  FallingStar({
    required this.key,
    required this.x,
    required this.y,
    required this.speed,
    required this.caughtAnimationController,
    this.isCaught = false,
  }) : scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
         CurvedAnimation(
           parent: caughtAnimationController,
           curve: Curves.easeOut,
         ),
       ),
       fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
         CurvedAnimation(
           parent: caughtAnimationController,
           curve: Curves.easeIn,
         ),
       );
}

class LoadingGame extends StatefulWidget {
  LoadingGame({super.key});
  final _hapticService = getIt<HapticService>();
  final _soundService = getIt<SoundService>();

  @override
  State<LoadingGame> createState() => _LoadingGameState();
}

class _LoadingGameState extends State<LoadingGame>
    with TickerProviderStateMixin {
  final List<FallingStar> _stars = [];
  int _score = 0;
  Timer? _gameLoopTimer;
  Timer? _starSpawnTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _score = 0;
    _stars.clear();
    _startStarSpawnTimer();
    _startGameLoop();
  }

  void _startStarSpawnTimer() {
    _starSpawnTimer = Timer.periodic(const Duration(milliseconds: 700), (
      timer,
    ) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _spawnStar();
    });
  }

  void _startGameLoop() {
    _gameLoopTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _updateStars();
      });
    });
  }

  void _spawnStar() {
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _stars.add(
      FallingStar(
        key: UniqueKey(),
        x: _random.nextDouble(),
        y: -0.1,
        speed: 0.005 + _random.nextDouble() * 0.005,
        caughtAnimationController: animationController,
      ),
    );
  }

  void _updateStars() {
    _stars.removeWhere((star) {
      if (star.isCaught && star.caughtAnimationController.isCompleted) {
        star.caughtAnimationController.dispose();
        return true;
      }
      star.y += star.speed;
      return star.y > 1.1;
    });
  }

  void _onStarTapped(FallingStar star) async {
    if (!star.isCaught) {
      widget._hapticService.playCorrectFeedback();
      widget._soundService.playPopSound();
      setState(() {
        star.isCaught = true;
        _score++;
        star.caughtAnimationController.forward();
      });
    }
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    _starSpawnTimer?.cancel();
    for (var star in _stars) {
      star.caughtAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.surfaceContainerHigh, colorScheme.surface],
          ),
        ),
        child: Stack(
          children: [
            // Animated Background Particles
            const ParticleBackground(),
            // Score and Context Display
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Let's play 'Catch the Star' while I make a new story for you!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your Score: $_score',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Falling Stars
            ..._stars.map((star) {
              return Positioned(
                key: star.key,
                left: star.x * screenSize.width,
                top: star.y * screenSize.height,
                child: GestureDetector(
                  onTap: () => _onStarTapped(star),
                  child: Container(
                    // Increased tappable area with padding
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedBuilder(
                      animation: star.caughtAnimationController,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: star.fadeAnimation,
                          child: Transform.scale(
                            scale: star.scaleAnimation.value,
                            child: child,
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: colorScheme.secondary.withValues(alpha: 0.5),
                            size: 50,
                          ),
                          Icon(
                            Icons.star,
                            color: colorScheme.secondary,
                            size: 40 + (star.speed * 50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            setState(() {
              for (var particle in _particles) {
                particle.y -= particle.speed;
                if (particle.y < -10) {
                  particle.y = MediaQuery.of(context).size.height + 10;
                  particle.x =
                      _random.nextDouble() * MediaQuery.of(context).size.width;
                }
              }
            });
          });
    _controller.repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createParticles();
    });
  }

  void _createParticles() {
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < 50; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          size: _random.nextDouble() * 2 + 1,
          speed: _random.nextDouble() * 0.5 + 0.2,
          color: Colors.white.withValues(
            alpha: _random.nextDouble() * 0.5 + 0.2,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ParticlePainter(particles: _particles),
      child: Container(),
    );
  }
}

class _Particle {
  double x;
  double y;
  double size;
  double speed;
  Color color;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.color,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var particle in particles) {
      paint.color = particle.color;
      canvas.drawCircle(Offset(particle.x, particle.y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
