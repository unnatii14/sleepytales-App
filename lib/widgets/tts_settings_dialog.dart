import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_player_provider.dart';

class TtsSettingsDialog extends StatelessWidget {
  const TtsSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        return Dialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.record_voice_over,
                      color: Color(0xFF6366F1),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Narrator Settings',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Speech Rate
                _buildSliderSetting(
                  context,
                  label: 'Reading Speed',
                  icon: Icons.speed,
                  value: audioProvider.speechRate,
                  min: 0.1,
                  max: 1.0,
                  divisions: 18,
                  valueLabel: _getSpeedLabel(audioProvider.speechRate),
                  onChanged: (value) {
                    audioProvider.setSpeechRate(value);
                  },
                ),
                const SizedBox(height: 20),

                // Pitch
                _buildSliderSetting(
                  context,
                  label: 'Voice Pitch',
                  icon: Icons.graphic_eq,
                  value: audioProvider.pitch,
                  min: 0.5,
                  max: 2.0,
                  divisions: 15,
                  valueLabel: _getPitchLabel(audioProvider.pitch),
                  onChanged: (value) {
                    audioProvider.setPitch(value);
                  },
                ),
                const SizedBox(height: 20),

                // Volume
                _buildSliderSetting(
                  context,
                  label: 'Narrator Volume',
                  icon: Icons.volume_up,
                  value: audioProvider.volume,
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  valueLabel: '${(audioProvider.volume * 100).round()}%',
                  onChanged: (value) {
                    audioProvider.setVolume(value);
                  },
                ),
                const SizedBox(height: 24),

                // Info text
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF6366F1),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Adjust settings while playing to hear changes',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Close button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSliderSetting(
    BuildContext context, {
    required String label,
    required IconData icon,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String valueLabel,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF6366F1), size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                valueLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6366F1),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF6366F1),
            inactiveTrackColor: const Color(0xFF6366F1).withOpacity(0.2),
            thumbColor: const Color(0xFF6366F1),
            overlayColor: const Color(0xFF6366F1).withOpacity(0.2),
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  String _getSpeedLabel(double speed) {
    if (speed < 0.3) return 'Very Slow';
    if (speed < 0.5) return 'Slow';
    if (speed < 0.7) return 'Normal';
    if (speed < 0.9) return 'Fast';
    return 'Very Fast';
  }

  String _getPitchLabel(double pitch) {
    if (pitch < 0.8) return 'Deep';
    if (pitch < 1.0) return 'Low';
    if (pitch < 1.3) return 'Normal';
    if (pitch < 1.7) return 'High';
    return 'Very High';
  }
}
