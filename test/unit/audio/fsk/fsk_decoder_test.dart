import 'package:flutter_test/flutter_test.dart';
import 'package:mrumru/mrumru.dart';
import 'package:mrumru/src/audio/fsk/fsk_decoder.dart';

void main() {
  group('Test of FskDecoder.decodeFrequenciesToBinary()', () {
    String expectedBinaryData =
        '0000000000010100001100010011001000110011001101001000000100000001000101000011010100110110001101110011100011001111000000100001010000111001001110100011101100111100111001110000001100010100001111010011111000111111010000001000011100000100000101000100000101000010010000110100010011001011000001010001010001000101010001100100011101001000101111100000011000010100010010010100101001001011010011001100011100000111000101000100110101001110010011110101000010000011000010000001010001010001010100100101001101010100111000000000100100010100010101010101011001010111010110001101101100001010000101000101100101011010010110110101110111010001000010110001010001011110010111110110000001100001111010010000110000010100011000100110001101100100011001011110000000001101000101000110011001100111011010000110100110101110000011100001010001101010011010110110110001101101100111110000111100010100011011100110111101110000011100010110010000010000000101000111001001110011011101000111010111111111000100010001010001110110011101110111100001111001100010110001001000010100011110100111101101111100011111011101110100010011000101000000000000000000000000000111111010011001';

    test('Should return [binary data] from given frequencies for chunksCount (1)', () {
      // Arrange
      AudioSettingsModel actualAudioSettingsModel = AudioSettingsModel.withDefaults().copyWith(chunksCount: 1);
      FskDecoder actualFskDecoder = FskDecoder(actualAudioSettingsModel);

      // @formatter:off
      List<int> actualFrequencies = <int>[400, 400, 400, 400, 400, 600, 600, 400, 400, 1000, 400, 600, 400, 1000, 400, 800, 400, 1000, 400, 1000, 400, 1000, 600, 400, 800, 400, 400, 600, 400, 400, 400, 600, 400, 600, 600, 400, 400, 1000, 600, 600, 400, 1000, 600, 800, 400, 1000, 600, 1000, 400, 1000, 800, 400, 1000, 400, 1000, 1000, 400, 400, 400, 800, 400, 600, 600, 400, 400, 1000, 800, 600, 400, 1000, 800, 800, 400, 1000, 800, 1000, 400, 1000, 1000, 400, 1000, 800, 600, 1000, 400, 400, 400, 1000, 400, 600, 600, 400, 400, 1000, 1000, 600, 400, 1000, 1000, 800, 400, 1000, 1000, 1000, 600, 400, 400, 400, 800, 400, 600, 1000, 400, 400, 600, 400, 400, 600, 600, 400, 600, 400, 400, 600, 600, 400, 400, 800, 600, 400, 400, 1000, 600, 400, 600, 400, 1000, 400, 800, 1000, 400, 400, 600, 600, 400, 600, 600, 400, 600, 400, 600, 600, 600, 400, 600, 800, 600, 400, 600, 1000, 600, 400, 800, 400, 800, 1000, 1000, 800, 400, 400, 600, 800, 400, 600, 600, 400, 600, 400, 800, 600, 600, 400, 800, 800, 600, 400, 800, 1000, 600, 400, 1000, 400, 1000, 400, 600, 1000, 400, 400, 600, 1000, 400, 600, 600, 400, 600, 400, 1000, 600, 600, 400, 1000, 800, 600, 400, 1000, 1000, 600, 600, 400, 400, 800, 400, 400, 1000, 400, 400, 800, 400, 400, 600, 600, 400, 600, 600, 400, 600, 600, 600, 400, 800, 600, 600, 400, 1000, 600, 600, 600, 400, 1000, 800, 400, 400, 400, 400, 800, 600, 400, 600, 600, 400, 600, 600, 600, 600, 600, 600, 600, 800, 600, 600, 600, 1000, 600, 600, 800, 400, 1000, 600, 800, 1000, 400, 400, 800, 800, 400, 600, 600, 400, 600, 600, 800, 600, 600, 600, 800, 800, 600, 600, 800, 1000, 600, 600, 1000, 600, 1000, 600, 400, 600, 400, 400, 800, 1000, 400, 600, 600, 400, 600, 600, 1000, 800, 600, 600, 1000, 1000, 600, 800, 400, 400, 600, 800, 400, 600, 1000, 800, 800, 600, 400, 400, 1000, 400, 400, 600, 600, 400, 600, 800, 400, 800, 600, 800, 400, 1000, 600, 800, 600, 400, 600, 800, 600, 600, 1000, 800, 400, 400, 400, 400, 1000, 600, 400, 600, 600, 400, 600, 800, 600, 800, 600, 800, 600, 1000, 600, 800, 800, 400, 600, 800, 800, 600, 800, 800, 1000, 800, 400, 400, 1000, 800, 400, 600, 600, 400, 600, 800, 800, 800, 600, 800, 800, 1000, 600, 800, 1000, 400, 600, 800, 1000, 600, 800, 600, 1000, 1000, 400, 400, 1000, 1000, 400, 600, 600, 400, 600, 800, 1000, 800, 600, 800, 1000, 1000, 600, 1000, 400, 400, 600, 1000, 400, 600, 600, 800, 600, 400, 400, 600, 400, 400, 400, 600, 600, 400, 600, 1000, 400, 800, 600, 1000, 400, 1000, 600, 1000, 600, 400, 600, 1000, 600, 600, 1000, 1000, 1000, 1000, 400, 600, 400, 600, 400, 600, 600, 400, 600, 1000, 600, 800, 600, 1000, 600, 1000, 600, 1000, 800, 400, 600, 1000, 800, 600, 800, 400, 800, 1000, 400, 600, 400, 800, 400, 600, 600, 400, 600, 1000, 800, 800, 600, 1000, 800, 1000, 600, 1000, 1000, 400, 600, 1000, 1000, 600, 1000, 600, 1000, 600, 400, 600, 400, 1000, 400, 600, 600, 400, 400, 400, 400, 400, 400, 400, 400, 400, 400, 400, 400, 400, 600, 1000, 1000, 800, 800, 600, 800, 600];
      // @formatter:on

      // Act
      String actualBinaryData = actualFskDecoder.decodeFrequenciesToBinary(actualFrequencies);

      // Assert
      expect(actualBinaryData, expectedBinaryData);
    });

    test('Should return [binary data] from given frequencies for chunksCount (2)', () {
      // Arrange
      AudioSettingsModel actualAudioSettingsModel = AudioSettingsModel.withDefaults().copyWith(chunksCount: 2);
      FskDecoder actualFskDecoder = FskDecoder(actualAudioSettingsModel);

      // @formatter:off
      List<int> actualFrequencies = <int>[400, 400, 400, 400, 400, 600, 600, 400, 400, 1000, 400, 600, 400, 1000, 400, 800, 400, 1000, 400, 1000, 400, 1000, 600, 400, 800, 400, 400, 600, 400, 400, 400, 600, 400, 600, 600, 400, 400, 1000, 600, 600, 400, 1000, 600, 800, 400, 1000, 600, 1000, 400, 1000, 800, 400, 1000, 400, 1000, 1000, 400, 400, 400, 800, 400, 600, 600, 400, 400, 1000, 800, 600, 400, 1000, 800, 800, 400, 1000, 800, 1000, 400, 1000, 1000, 400, 1000, 800, 600, 1000, 400, 400, 400, 1000, 400, 600, 600, 400, 400, 1000, 1000, 600, 400, 1000, 1000, 800, 400, 1000, 1000, 1000, 600, 400, 400, 400, 800, 400, 600, 1000, 400, 400, 600, 400, 400, 600, 600, 400, 600, 400, 400, 600, 600, 400, 400, 800, 600, 400, 400, 1000, 600, 400, 600, 400, 1000, 400, 800, 1000, 400, 400, 600, 600, 400, 600, 600, 400, 600, 400, 600, 600, 600, 400, 600, 800, 600, 400, 600, 1000, 600, 400, 800, 400, 800, 1000, 1000, 800, 400, 400, 600, 800, 400, 600, 600, 400, 600, 400, 800, 600, 600, 400, 800, 800, 600, 400, 800, 1000, 600, 400, 1000, 400, 1000, 400, 600, 1000, 400, 400, 600, 1000, 400, 600, 600, 400, 600, 400, 1000, 600, 600, 400, 1000, 800, 600, 400, 1000, 1000, 600, 600, 400, 400, 800, 400, 400, 1000, 400, 400, 800, 400, 400, 600, 600, 400, 600, 600, 400, 600, 600, 600, 400, 800, 600, 600, 400, 1000, 600, 600, 600, 400, 1000, 800, 400, 400, 400, 400, 800, 600, 400, 600, 600, 400, 600, 600, 600, 600, 600, 600, 600, 800, 600, 600, 600, 1000, 600, 600, 800, 400, 1000, 600, 800, 1000, 1600, 1600, 2000, 2000, 1600, 1800, 1800, 1600, 1800, 1800, 2000, 1800, 1800, 1800, 2000, 2000, 1800, 1800, 2000, 2200, 1800, 1800, 2200, 1800, 2200, 1800, 1600, 1800, 1600, 1600, 2000, 2200, 1600, 1800, 1800, 1600, 1800, 1800, 2200, 2000, 1800, 1800, 2200, 2200, 1800, 2000, 1600, 1600, 1800, 2000, 1600, 1800, 2200, 2000, 2000, 1800, 1600, 1600, 2200, 1600, 1600, 1800, 1800, 1600, 1800, 2000, 1600, 2000, 1800, 2000, 1600, 2200, 1800, 2000, 1800, 1600, 1800, 2000, 1800, 1800, 2200, 2000, 1600, 1600, 1600, 1600, 2200, 1800, 1600, 1800, 1800, 1600, 1800, 2000, 1800, 2000, 1800, 2000, 1800, 2200, 1800, 2000, 2000, 1600, 1800, 2000, 2000, 1800, 2000, 2000, 2200, 2000, 1600, 1600, 2200, 2000, 1600, 1800, 1800, 1600, 1800, 2000, 2000, 2000, 1800, 2000, 2000, 2200, 1800, 2000, 2200, 1600, 1800, 2000, 2200, 1800, 2000, 1800, 2200, 2200, 1600, 1600, 2200, 2200, 1600, 1800, 1800, 1600, 1800, 2000, 2200, 2000, 1800, 2000, 2200, 2200, 1800, 2200, 1600, 1600, 1800, 2200, 1600, 1800, 1800, 2000, 1800, 1600, 1600, 1800, 1600, 1600, 1600, 1800, 1800, 1600, 1800, 2200, 1600, 2000, 1800, 2200, 1600, 2200, 1800, 2200, 1800, 1600, 1800, 2200, 1800, 1800, 2200, 2200, 2200, 2200, 1600, 1800, 1600, 1800, 1600, 1800, 1800, 1600, 1800, 2200, 1800, 2000, 1800, 2200, 1800, 2200, 1800, 2200, 2000, 1600, 1800, 2200, 2000, 1800, 2000, 1600, 2000, 2200, 1600, 1800, 1600, 2000, 1600, 1800, 1800, 1600, 1800, 2200, 2000, 2000, 1800, 2200, 2000, 2200, 1800, 2200, 2200, 1600, 1800, 2200, 2200, 1800, 2200, 1800, 2200, 1800, 1600, 1800, 1600, 2200, 1600, 1800, 1800, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1600, 1800, 2200, 2200, 2000, 2000, 1800, 2000, 1800];
      // @formatter:on

      // Act
      String actualBinaryData = actualFskDecoder.decodeFrequenciesToBinary(actualFrequencies);

      // Assert
      expect(actualBinaryData, expectedBinaryData);
    });

    test('Should return [binary data] from given frequencies for chunksCount (4)', () {
      // Arrange
      AudioSettingsModel actualAudioSettingsModel = AudioSettingsModel.withDefaults().copyWith(chunksCount: 4);
      FskDecoder actualFskDecoder = FskDecoder(actualAudioSettingsModel);

      // @formatter:off
      List<int> actualFrequencies = <int>[400, 400, 400, 400, 400, 600, 600, 400, 400, 1000, 400, 600, 400, 1000, 400, 800, 400, 1000, 400, 1000, 400, 1000, 600, 400, 800, 400, 400, 600, 400, 400, 400, 600, 400, 600, 600, 400, 400, 1000, 600, 600, 400, 1000, 600, 800, 400, 1000, 600, 1000, 400, 1000, 800, 400, 1000, 400, 1000, 1000, 400, 400, 400, 800, 400, 600, 600, 400, 400, 1000, 800, 600, 400, 1000, 800, 800, 400, 1000, 800, 1000, 400, 1000, 1000, 400, 1000, 800, 600, 1000, 400, 400, 400, 1000, 400, 600, 600, 400, 400, 1000, 1000, 600, 400, 1000, 1000, 800, 400, 1000, 1000, 1000, 600, 400, 400, 400, 800, 400, 600, 1000, 400, 400, 600, 400, 400, 600, 600, 400, 600, 400, 400, 600, 600, 400, 400, 800, 600, 400, 400, 1000, 600, 400, 600, 400, 1000, 400, 800, 1000, 1600, 1600, 1800, 1800, 1600, 1800, 1800, 1600, 1800, 1600, 1800, 1800, 1800, 1600, 1800, 2000, 1800, 1600, 1800, 2200, 1800, 1600, 2000, 1600, 2000, 2200, 2200, 2000, 1600, 1600, 1800, 2000, 1600, 1800, 1800, 1600, 1800, 1600, 2000, 1800, 1800, 1600, 2000, 2000, 1800, 1600, 2000, 2200, 1800, 1600, 2200, 1600, 2200, 1600, 1800, 2200, 1600, 1600, 1800, 2200, 1600, 1800, 1800, 1600, 1800, 1600, 2200, 1800, 1800, 1600, 2200, 2000, 1800, 1600, 2200, 2200, 1800, 1800, 1600, 1600, 2000, 1600, 1600, 2200, 1600, 1600, 2000, 1600, 1600, 1800, 1800, 1600, 1800, 1800, 1600, 1800, 1800, 1800, 1600, 2000, 1800, 1800, 1600, 2200, 1800, 1800, 1800, 1600, 2200, 2000, 1600, 1600, 1600, 1600, 2000, 1800, 1600, 1800, 1800, 1600, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 2000, 1800, 1800, 1800, 2200, 1800, 1800, 2000, 1600, 2200, 1800, 2000, 2200, 2800, 2800, 3200, 3200, 2800, 3000, 3000, 2800, 3000, 3000, 3200, 3000, 3000, 3000, 3200, 3200, 3000, 3000, 3200, 3400, 3000, 3000, 3400, 3000, 3400, 3000, 2800, 3000, 2800, 2800, 3200, 3400, 2800, 3000, 3000, 2800, 3000, 3000, 3400, 3200, 3000, 3000, 3400, 3400, 3000, 3200, 2800, 2800, 3000, 3200, 2800, 3000, 3400, 3200, 3200, 3000, 2800, 2800, 3400, 2800, 2800, 3000, 3000, 2800, 3000, 3200, 2800, 3200, 3000, 3200, 2800, 3400, 3000, 3200, 3000, 2800, 3000, 3200, 3000, 3000, 3400, 3200, 2800, 2800, 2800, 2800, 3400, 3000, 2800, 3000, 3000, 2800, 3000, 3200, 3000, 3200, 3000, 3200, 3000, 3400, 3000, 3200, 3200, 2800, 3000, 3200, 3200, 3000, 3200, 3200, 3400, 3200, 2800, 2800, 3400, 3200, 2800, 3000, 3000, 2800, 3000, 3200, 3200, 3200, 3000, 3200, 3200, 3400, 3000, 3200, 3400, 2800, 3000, 3200, 3400, 3000, 3200, 3000, 3400, 3400, 4000, 4000, 4600, 4600, 4000, 4200, 4200, 4000, 4200, 4400, 4600, 4400, 4200, 4400, 4600, 4600, 4200, 4600, 4000, 4000, 4200, 4600, 4000, 4200, 4200, 4400, 4200, 4000, 4000, 4200, 4000, 4000, 4000, 4200, 4200, 4000, 4200, 4600, 4000, 4400, 4200, 4600, 4000, 4600, 4200, 4600, 4200, 4000, 4200, 4600, 4200, 4200, 4600, 4600, 4600, 4600, 4000, 4200, 4000, 4200, 4000, 4200, 4200, 4000, 4200, 4600, 4200, 4400, 4200, 4600, 4200, 4600, 4200, 4600, 4400, 4000, 4200, 4600, 4400, 4200, 4400, 4000, 4400, 4600, 4000, 4200, 4000, 4400, 4000, 4200, 4200, 4000, 4200, 4600, 4400, 4400, 4200, 4600, 4400, 4600, 4200, 4600, 4600, 4000, 4200, 4600, 4600, 4200, 4600, 4200, 4600, 4200, 4000, 4200, 4000, 4600, 4000, 4200, 4200, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4000, 4200, 4600, 4600, 4400, 4400, 4200, 4400, 4200];
      // @formatter:on

      // Act
      String actualBinaryData = actualFskDecoder.decodeFrequenciesToBinary(actualFrequencies);

      // Assert
      expect(actualBinaryData, expectedBinaryData);
    });

    test('Should return [binary data] from given frequencies for chunksCount (8)', () {
      // Arrange
      AudioSettingsModel actualAudioSettingsModel = AudioSettingsModel.withDefaults().copyWith(chunksCount: 8);
      FskDecoder actualFskDecoder = FskDecoder(actualAudioSettingsModel);

      // @formatter:off
      List<int> actualFrequencies = <int>[400, 400, 400, 400, 400, 600, 600, 400, 400, 1000, 400, 600, 400, 1000, 400, 800, 400, 1000, 400, 1000, 400, 1000, 600, 400, 800, 400, 400, 600, 400, 400, 400, 600, 400, 600, 600, 400, 400, 1000, 600, 600, 400, 1000, 600, 800, 400, 1000, 600, 1000, 400, 1000, 800, 400, 1000, 400, 1000, 1000, 400, 400, 400, 800, 400, 600, 600, 400, 400, 1000, 800, 600, 400, 1000, 2000, 2000, 1600, 2200, 2000, 2200, 1600, 2200, 2200, 1600, 2200, 2000, 1800, 2200, 1600, 1600, 1600, 2200, 1600, 1800, 1800, 1600, 1600, 2200, 2200, 1800, 1600, 2200, 2200, 2000, 1600, 2200, 2200, 2200, 1800, 1600, 1600, 1600, 2000, 1600, 1800, 2200, 1600, 1600, 1800, 1600, 1600, 1800, 1800, 1600, 1800, 1600, 1600, 1800, 1800, 1600, 1600, 2000, 1800, 1600, 1600, 2200, 1800, 1600, 1800, 1600, 2200, 1600, 2000, 2200, 2800, 2800, 3000, 3000, 2800, 3000, 3000, 2800, 3000, 2800, 3000, 3000, 3000, 2800, 3000, 3200, 3000, 2800, 3000, 3400, 3000, 2800, 3200, 2800, 3200, 3400, 3400, 3200, 2800, 2800, 3000, 3200, 2800, 3000, 3000, 2800, 3000, 2800, 3200, 3000, 3000, 2800, 3200, 3200, 3000, 2800, 3200, 3400, 3000, 2800, 3400, 2800, 3400, 2800, 3000, 3400, 2800, 2800, 3000, 3400, 2800, 3000, 3000, 2800, 3000, 2800, 3400, 3000, 3000, 2800, 4600, 4400, 4200, 4000, 4600, 4600, 4200, 4200, 4000, 4000, 4400, 4000, 4000, 4600, 4000, 4000, 4400, 4000, 4000, 4200, 4200, 4000, 4200, 4200, 4000, 4200, 4200, 4200, 4000, 4400, 4200, 4200, 4000, 4600, 4200, 4200, 4200, 4000, 4600, 4400, 4000, 4000, 4000, 4000, 4400, 4200, 4000, 4200, 4200, 4000, 4200, 4200, 4200, 4200, 4200, 4200, 4200, 4400, 4200, 4200, 4200, 4600, 4200, 4200, 4400, 4000, 4600, 4200, 4400, 4600, 5200, 5200, 5600, 5600, 5200, 5400, 5400, 5200, 5400, 5400, 5600, 5400, 5400, 5400, 5600, 5600, 5400, 5400, 5600, 5800, 5400, 5400, 5800, 5400, 5800, 5400, 5200, 5400, 5200, 5200, 5600, 5800, 5200, 5400, 5400, 5200, 5400, 5400, 5800, 5600, 5400, 5400, 5800, 5800, 5400, 5600, 5200, 5200, 5400, 5600, 5200, 5400, 5800, 5600, 5600, 5400, 5200, 5200, 5800, 5200, 5200, 5400, 5400, 5200, 5400, 5600, 5200, 5600, 5400, 5600, 6400, 7000, 6600, 6800, 6600, 6400, 6600, 6800, 6600, 6600, 7000, 6800, 6400, 6400, 6400, 6400, 7000, 6600, 6400, 6600, 6600, 6400, 6600, 6800, 6600, 6800, 6600, 6800, 6600, 7000, 6600, 6800, 6800, 6400, 6600, 6800, 6800, 6600, 6800, 6800, 7000, 6800, 6400, 6400, 7000, 6800, 6400, 6600, 6600, 6400, 6600, 6800, 6800, 6800, 6600, 6800, 6800, 7000, 6600, 6800, 7000, 6400, 6600, 6800, 7000, 6600, 6800, 6600, 7000, 7000, 7600, 7600, 8200, 8200, 7600, 7800, 7800, 7600, 7800, 8000, 8200, 8000, 7800, 8000, 8200, 8200, 7800, 8200, 7600, 7600, 7800, 8200, 7600, 7800, 7800, 8000, 7800, 7600, 7600, 7800, 7600, 7600, 7600, 7800, 7800, 7600, 7800, 8200, 7600, 8000, 7800, 8200, 7600, 8200, 7800, 8200, 7800, 7600, 7800, 8200, 7800, 7800, 8200, 8200, 8200, 8200, 7600, 7800, 7600, 7800, 7600, 7800, 7800, 7600, 7800, 8200, 7800, 8000, 7800, 8200, 9000, 9400, 9000, 9400, 9200, 8800, 9000, 9400, 9200, 9000, 9200, 8800, 9200, 9400, 8800, 9000, 8800, 9200, 8800, 9000, 9000, 8800, 9000, 9400, 9200, 9200, 9000, 9400, 9200, 9400, 9000, 9400, 9400, 8800, 9000, 9400, 9400, 9000, 9400, 9000, 9400, 9000, 8800, 9000, 8800, 9400, 8800, 9000, 9000, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 8800, 9000, 9400, 9400, 9200, 9200, 9000, 9200, 9000];
      // @formatter:on

      // Act
      String actualBinaryData = actualFskDecoder.decodeFrequenciesToBinary(actualFrequencies);

      // Assert
      expect(actualBinaryData, expectedBinaryData);
    });
  });
}