import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/utils/resources/api_key.dart';
import '../models/chat_model.dart';

class ChatDataSource {
  final String contexts;
  final Map<String, String> query;

  ChatDataSource({required this.contexts, required this.query});

  Future<ChatModel> getResponse(String? prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: apikey,
        safetySettings: [
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium),
          SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        ],
      );
      final generationConfig = GenerationConfig(
        temperature: 1,
        topP: 0.95,
        topK: 64,
        maxOutputTokens: 250,
        responseMimeType: 'text/plain',
      );

      final responseText = await model.generateContent(
        [
          Content.multi([TextPart('$contexts\n${prompt!}')])
        ],
        generationConfig: generationConfig,
      );

      return ChatModel(response: responseText.text);
    } catch (e) {
      print('Error in getResponse: $e');
      rethrow;
    }
  }
}
