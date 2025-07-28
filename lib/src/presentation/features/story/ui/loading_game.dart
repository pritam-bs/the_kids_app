import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class FallingStar {
  final Key key; // Unique key for widget identity
  double x; // Horizontal position (0.0 to 1.0, relative to screen width)
  double y; // Vertical position (0.0 to 1.0, relative to screen height)
  double speed; // How fast it falls
  bool isCaught; // Whether it has been tapped

  FallingStar({
    required this.key,
    required this.x,
    required this.y,
    required this.speed,
    this.isCaught = false,
  });
}

class LoadingGame extends StatefulWidget {
  const LoadingGame({super.key});

  @override
  State<LoadingGame> createState() => _LoadingGameState();
}

class _LoadingGameState extends State<LoadingGame> {
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
    _stars.add(
      FallingStar(
        key: UniqueKey(),
        x: _random.nextDouble(), // Random X position (0.0 to 1.0)
        y: -0.1, // Start slightly above the screen
        speed: 0.005 + _random.nextDouble() * 0.005, // Random speed
      ),
    );
  }

  void _updateStars() {
    _stars.removeWhere((star) {
      if (star.isCaught) {
        return true;
      }
      star.y += star.speed;
      return star.y > 1.1;
    });
  }

  void _onStarTapped(FallingStar star) {
    if (!star.isCaught) {
      setState(() {
        star.isCaught = true;
        _score++;
      });
    }
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    _starSpawnTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surface,
      child: Stack(
        children: [
          // Score and Context Display
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Let's play 'Catch the Star' while I make a new story for you!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
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
              key: star.key, // Use unique key for AnimatedPositioned
              left: star.x * screenSize.width,
              top: star.y * screenSize.height,
              child: GestureDetector(
                onTap: () => _onStarTapped(star),
                child: AnimatedOpacity(
                  opacity: star.isCaught ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Transform.scale(
                    scale:
                        1.0 +
                        (star.speed *
                            50), // Scale based on speed for visual variety
                    child: Icon(
                      Icons.star, // Simple star icon
                      color: colorScheme.secondary,
                      size: 40,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
