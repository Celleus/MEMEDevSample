# MEMEDevSample

## install
1.MEMEDevSamle > MEMEDevSDK1.0 > develop > MEMEDev.frameworkをプロジェクトに追加する
- frameworkの追加後は target > Build Phases > Copy Files に MEMEDev.frameworkを追加するのを忘れないようにしてください。
- 実機で実行したい場合は MEMEDevSamle > MEMEDevSDK1.0 > product > MEMEDev.framework を追加してください。

2.MEMEDevSamle > Sample > rtd.csvをプロジェクトに追加する

## usage
1.ヘッダーファイルのインポート

`#import <MEMEDev/MEMEDev.h>`

2.デリゲートの設定

`[MEMEDev sharedInstance].delegate = self;`

3.データの受け取りを開始する

`[MEMEDev startDataReport];`

4.デリゲートメソッド内に任意の処理を記述する

`- (void)memeRealTimeModeDataReceived:(MEMERealTimeData *)data { }`
