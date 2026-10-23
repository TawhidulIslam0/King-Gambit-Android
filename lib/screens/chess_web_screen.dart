// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChessWebScreen extends StatefulWidget {
  const ChessWebScreen({super.key});

  @override
  State<ChessWebScreen> createState() => _ChessWebScreenState();
}

class _ChessWebScreenState extends State<ChessWebScreen> {
  static const String _gameUrl =
      'https://tawhidulislam0.github.io/medieval-chess-game-3d/';

  late final WebViewController _controller;
  int _progress = 0;
  bool _loading = true;
  bool _hasError = false;
  String _errorMessage = 'Could not load the game. Check your connection and try again.';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF090B10))
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (!mounted) return;
            setState(() {
              _progress = progress;
              _loading = progress < 100;
              if (progress > 0) _hasError = false;
            });
          },
          onPageStarted: (_) {
            if (!mounted) return;
            setState(() {
              _loading = true;
              _hasError = false;
              _progress = 0;
            });
          },
          onPageFinished: (_) {
            if (!mounted) return;
            setState(() {
              _loading = false;
              _progress = 100;
              _hasError = false;
            });
          },
          onWebResourceError: (error) {
            // Subresources (models/audio) can report errors while the page
            // itself is still usable, so only show the full-page error when
            // the main frame failed.
            if (error.isForMainFrame != true || !mounted) return;
            setState(() {
              _loading = false;
              _hasError = true;
              _errorMessage = error.description.isEmpty
                  ? 'Could not load the game. Check your connection and try again.'
                  : error.description;
            });
          },
          onNavigationRequest: (request) {
            // Keep game navigation inside the app so the original experience
            // continues to work as a mobile app rather than opening a browser.
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_gameUrl));
  }

  Future<bool> _handleBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    }
    // The game is the root screen. Don't unexpectedly close it on one back tap.
    return false;
  }

  Future<void> _reload() async {
    setState(() {
      _hasError = false;
      _loading = true;
      _progress = 0;
    });
    await _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) await _handleBack();
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            WebViewWidget(controller: _controller),
            if (_loading && !_hasError)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  value: _progress == 0 ? null : _progress / 100,
                  minHeight: 2,
                  backgroundColor: Colors.transparent,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFFD9B878)),
                ),
              ),
            if (_hasError)
              ColoredBox(
                color: const Color(0xFF090B10),
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.castle_rounded,
                              size: 54, color: Color(0xFFD9B878)),
                          const SizedBox(height: 18),
                          const Text(
                            "King's Gambit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 22),
                          FilledButton.icon(
                            onPressed: _reload,
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Try again'),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFD9B878),
                              foregroundColor: const Color(0xFF17130B),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                const ClipboardData(text: _gameUrl),
                              );
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Game link copied')),
                              );
                            },
                            child: const Text('Copy original game link'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
