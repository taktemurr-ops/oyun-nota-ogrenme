import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_nota_ogrenme/oyun_nota_ogrenme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(notaOgrenmeConfig.title.length, 33);
    expect(notaOgrenmeConfig.tagline.length, 33);
    for (final s in notaOgrenmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(notaOgrenmeConfig.gameId, notaOgrenmeId);
    expect(notaOgrenmeRules.gameId, notaOgrenmeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(notaOgrenmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: notaOgrenmeId, optionalMechanics: notaOgrenmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(notaOgrenmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
