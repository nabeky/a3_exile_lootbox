*Japanese documents(UTF,tab:4)
*Versionings: look at (config.cpp)
*Change log at End of doc.
*We are looking for someone who can translate this document　;-)
(Japanese => English,German,French,Russian etc..)

|	LOOT BOX for Arma3 EXILE MOD(Server-Addon)
|		to Arma3 All Communities,Survivors,Bohemia
|	アイテム漁りに小さな幸せを・・　/ for beggar-man
|	"a3_exile_lootbox"
|	*if u want support? blog.ahh.jp (Japanese only)
|	*included documents "readme_jp.txt" but japanese only.
|	*currently working on "readme_en.txt" for english (yukihito23)
|	*If anyone is interested in translating!(French,German etc.)

|	開発&著作 / Dev.&Auth.：nabek 2018/4-
|	クリエイティヴ・コモンズ 表示 - 非営利 4.0 国際 (CC BY-NC 4.0)
|	Discord : https://discord.gg/b4FT278
|	GitHub : https://github.com/nabeky/a3_exile_lootbox
|	Blog : http://blog.ahh.jp/?tag=arma3
|	Server : [JP]鯖味噌:Saba-Miso Exile|PvP|Takistan
|	
|	Special Thanks!
|		yukihito23, Losty

|	取扱説明書 / Manual （日本語 / Japanese）
|	目次 / Index
|	o アドオン概要 / Overview
|	o 動作確認 / Environment
|	o 動作説明 / Description
|	o インストール方法 / Installation
|	o 設定方法 / Settings
|	o ライセンス・サポートについて / License & Supports
|	o たぶん開発者らしいnabekから / from Dev.nabek
|	o 参考資料 / Documents
|	o 更新履歴 / Change logs
|дﾟ)
-------------------------------------------------------------------------------
■■ アドオン概要 / Overview
Arma3 EXILE MODサーバ専用アドオンとなります。
マップ上に点在する "町"（ローケーション） に重きを置いた機能を中心に提供します。
閑散としがちな町やランドマークを、プレーヤーに注目してもらおうというアドオンです。

アイテム漁りのために、通常のアイテム湧きとは別に、町中の地表または建物内のどこかに、アイテムボックスを配置します。
アイテムボックスには、主に初期プレーヤーのためになるアイテムやポップタブ、ゴミが入っています。
（分かり難い場所、アイテムボックス周辺に、ランダムでワイヤートラップや地雷を設置）
車両湧きも、独自機能を搭載してます
（ExileServerの機能の代替えに利用可能。スポーン地車両／通常湧き車両）
他にも多くの機能を内蔵しており、序盤のプレーヤーを飽きさせない、普段とは違う雰囲気を提供できます。
多くの機能は、大きく分けて、以下に分けられます。

	o マップロケーションに関した機能群
	o 単体で機能する機能群

ロケーションに関した機能は、マップデータから自動設定するため、サーバディレクトリにコピーするだけで動作します。
クライアント側（mp_mission.pbo）の設定は不要です。
サーバ起動時に処理のほとんどが完了しますので、稼働中は低負荷となります。
必要なサーバアドオンとして、「Arma3 DMS(a3_dms)」が必要となります（ＡＩ生成に利用）

■ ロケーションエンジンに関する主な機能
	o 位置設定などは自動認識して動作
		自動でマップデータから取得して自動で作動します
		マップを変えても、（基本的に）そのまま動作します
		固定位置で設定した場合は除きます。
	o 町に、アイテムボックスを配置
		屋内／屋外にランダム配置されます
		きめ細やかにアイテム要素を設定できます
		（町の大きさに合わせて設定可能、３段階）
		また、同時にワイヤートラップを仕掛けられます
	o マガジン残弾数がランダムになります
		湧きアイテムに残数のあるものは、ランダムになります
		（銃弾マガジン、マッチ、グレネードなど）
	o 町に、湧き車両や航空機を配置
		Server側との違いは、故障具合の細かな設定とアイテム湧き他
		GRPトラップや、グレネードトラップもあります
		（建物近くに湧くようになっており、道路上には湧きません）
	o 町に、バンディット町ＡＩを配置
		建物内に配置し、町を徘徊していたり、立て籠もっています
		（近くの給油所や車両、道路上を徘徊）
		場所（高所）によってスナイパーとなります
	o 町周辺に、地雷を配置
		道路上に設置されます
	o 町に、奇妙なオブジェクトや炎上オブジェクトを配置
		いつもと違う街の風景をプレーヤーに与えます
		路上ゴミ、破損車両など
	o 町の建物のドアがランダムで開いてます
		他プレーヤーの足跡を消します
	o キャンプファイヤーをランダム設置
		夜間の雰囲気や、プレーヤーのクラフト用に提供
	o トラベラーＡＩを配置
		町と町の間を移動しているＡＩ達
		要処間でのプレーヤーの遭遇確率を上げます
	o アイアン・ミラー大尉ＡＩ（無敵？）を配置
		治癒能力を持つ無敵？バンディットＡＩ
		（アイテムを一切残さず、リスペクトもゼロ）
	o GPSトラップ
		バンディットに見つかるとマップにマークされてしまいます
		車両エンジンONでも確立で作動します
		※当アドオンで発生したAIのみ
	o グレネードトラップ
		車両エンジンONにて確立でトラップが作動します
		（スモーク又はミニグレネード）
	o バンディットに占領された町
		どこかの大きな町一つがバンディット達に占領されています
		報酬の無いミッションのような扱いになります

■ 単体で機能するもの
	o トレーダー、ロッカー、水汲みやコンクリートミキサーを設置できます
		ミッションファイルでの設置でなく当アドオンから行えます
		固定では無くExileオブジェクトをランダムにできます
	o マップにオリジナルの地名を作成できます
		作成した場所はロケーションエンジンの対象となります
	o マップにテキストを表示できます
		ミッションファイルに記述することなく当アドオンから行えます
		テキストの他、マーカーや円形図形を描画できます
		日本語の場合は読みにくいです
	o カスタム看板を作成できます
		好きな画像を貼り付け、設置できます
		テクスチャー変更可能なオブジェクトなら看板で無くても構いません
	o サーバーメッセージ配信（システムチャット）
		定期的にメッセージを全プレーヤーに配信します
		最後文まで行くと最初文に戻ります
	o 給油所の故障（New! v1.5）
		マップ上の給油所をランダムで故障させます
		車両の自動給油が出来なくなりますがクラフトは可能です
	o 移動トレーダー（New! v1.5）
		マップ上を徒歩で移動しているトレーダー

当LOOTBOXアドオンの起動は、他アドオンと並列で動作します（遅延・負荷時待機可）
マップデータやサーバスペックによりますが、処理が完了するまでは、数分掛かります。
プレーヤーがイン可能な状態のまま、処理が続行中の場合があります。

※参考：CUP Takistanの場合、ロケーション数46、約1分50秒（Windows/Ryzen5 1400）

-------------------------------------------------------------------------------
■■ 動作確認 / Environment
Arma3 1.92.145539　(64bit/32bit)
Arma3 Dedicated Server
Windows 10 Home/Professional
Linux(Ubuntu 16.04LTS/17.10/18.04LTS)

必須MOD
	Exile MOD Server 1.0.3a/1.0.4a(Pineapple)
	https://www.exilemod.com/
必須ServerAddon
	DMS/Defent's Mission System　Server
	https://www.exilemod.com/topic/61-dms-defents-mission-system/

PBOファイルのパック＆アンパックは、以下のソフトウェアが必要になります。
	PBO Manager
	http://www.armaholic.com/page.php?id=16369
設定ファイル等の編集にお薦めなテキストエディタ
	Notepad+
	https://notepad-plus-plus.org/
	※VisualStudio Codeもよく使われてるそうです
公式の各種ユーティリティソフト群、あれば便利
	Arma3 Tools
	※Steamにて別途インストール可能
	※画像変換にも必須となります

-------------------------------------------------------------------------------
■■ 動作説明 / Description
[マップロケーション]
マップに登録されているロケーション情報（町やランドマーク等）を元に動作します。
デフォルトでは、建物が密集している「村／町／大きな町」を対象にしています。
ロケーションタイプだけでなく、個別にロケーション地名を指定する事も可能です（この場合、マップ依存になります）
タイプが合致すると、無条件に全ての町を対象にするため、無効にしたい場合は別途個別に設定してください。

他のランドマークも対象にしたい場合は、以下を参照するか、マップデータを調査してください。
https://community.bistudio.com/wiki/Location

	ロケーションタイプ名
	"NameVillage"　村・集落
	"NameCity"　町
	"NameCityCapital"　大きな町
	"NameLocal"　何らかのランドマーク (*)
	"Mount"　山
	"Airport"　空港
	etc..

	[Memo]
	マップデータには、地点毎に"タイプ名"と"地名"のセットで登録されてます。
	よって、タイプではなく、地名で指定すると、その１箇所のみが対象となります。
	町として登録されていない、任意のランドマーク（NameLocal）を対象にする場合は、ログファイルを参照して手動で設定してください。
	（CUP Takistanの場合、"山・林"、"集落"や"オイルパイプライン"、"地雷原"など）
	マップに依存する設定項目（NameLocal）となります。

	ランダム要素を増やすため、ロケーション発見時に、"基準点"を若干ランダムで移動させます。

	[Memo]
	ミリタリーエリア（軍事施設）に関しては、ロケーションタイプというのは存在しません。
	そのため、調査の上、独自に判断してます。主に空港となります。
	（Airport又はNameLocalに属している、NameCityCapitalの場合も有り）
	
[新しいロケーション作成]
マップ上に、独自にロケーションを作成する事ができます。
町として登録されていない場所を、任意に対象にする事が可能となります。
このロケーションを、ロケーションエンジンの動作対象にする事も可能となってます。

[アイテムボックス場所]
アイテムボックスの設置箇所は、簡単には見つからないような場所を探しています。
以下の条件内でランダムで決められます。
	o MAPデータ内ロケーション登録地点を基準とした範囲内
	o 範囲内の建物をランダムで選び、屋内外のいずれか
	※屋内：屋内のいずれかの場所（主に窓際や出入り口等）
		入口から最も遠い場所が選択されます
		建物によっては、最上階のパターンになります
	※屋外：建物の周囲、近辺になります
	（いずれも範囲内に建物が無い場合、無効となります）
	
	[Memo]
	o 屋内湧きは、buildingPositionデータを利用します

[アイテムリスト生成方法]
アイテムボックスや湧き車両コンテナ、バンディットＡＩの所持物に適用されます。
アイテムリストは、複数の要素によって決められます。
個々のアイテムボックス毎に、以下の各要素の合算分が統合され決定されます。

	１．アイテムリスト
		＋ 固定要素（倍率指定可）　*
		＋ リストから５０％要素　※若干のレア度
		＋　レアリスト　※それなりのレア度
		＋　スペシャルレア　※かなりなレア度
	２．シャッフル
	３．ゴミ化（又は削除）
	４．決定

	[Memo]
	可能な限り公平に分布されるよう計算の上配慮してます。
	最終的にはリスト順番もバラバラになるようにしています。
	コンテナキャパシティ制限により、入り切らない場合があります。
	固定要素は、バンディットAIの所持物の適用外となります。

[ゴミ化フィルター]
出来上がったアイテムリストに対して、ゴミ率を割合として置換します。
（つまり、ゴミ化率を１で設定すると、全てがゴミに変わってしまいます）
同一設定で、村でのアイテムボックスは、ゴミが多い、という形に出来ます。
ゴミに変えるではなく、削除する事も可能です。

[ポップタブ]
アイテムボックスに、ランダムでポップタブが格納されます。
設定された値を最大として、30%下限でランダムとなります。
車両も同様となります。

	例：指定値1000の場合、1000 x 0.3 = 300（下限値）
	300-1000の範囲でランダム

[アイテムボックストラップ]
トラップワイヤーが、アイテムボックス近くに設置されます（屋外のみ＆確立）
周囲2m付近に設置されます。
他トラップに変更する事ができます。

[アイテムボックス固定湧き]
ロケーションとは関係無く、指定場所にアイテムボックスを湧かせる事ができます。
迷路、山頂や行きにくい場所などのプライズ的な利用を想定しています。

	[Memo]
	Z値軸の"0"は、その地点の地表という意味になります。
	例：[1800,2130,0]
	セーフゾーンや拠点近くには設置できません（ブラックリスト）

[トラップ・地雷]
１ロケーションの全てのアイテムボックスを置き終わると、周囲の道路上に地雷をランダムで配置します。
とても、鬼畜な設定となりますので、ご注意ください。
EAST側には、地雷の場所が分かってる形になっているため、ＡＩが掛かる事は無いかと思います。
他トラップに変更する事ができます。

	[Memo]
	道の中央に設置されます。
	目視では、小さな黒い点でしか無いため、まず回避する事ができません。
	マップデータで道路として認識されている場所全てが適用されます（空港の滑走路など）

[GPSトラップ]
車両トラップか、バンディットに見つかった際に、マップ上に黒点マークされてしまいます。
バンディットに見つかった（又は射撃された）場合は、必ずマークされます。
同時に、バンディットによる全チャット報告がされます。
バンディットは、当アドオンでスポーンしたものに限ります。
（町ＡＩ、トラベラーＡＩ、アイアンミラーＡＩ）
射撃をトリガーとしているため、味方やゾンビなどに発砲した際も、マークされます。
全プレーヤーに、プレーヤーがその付近に居る事が、分かってしまいます。
車両の場合でも、確立でトラップが作動します。
マークされる場所は、おおよその場所となります。

	[Memo]
	車両の場合、５０％の確立で、トラップが確定し、グレネードトラップかGPSトラップとなります。
	マップマークは、ＡＩグループ単位で、１分間単位で更新されます。

[グレネードトラップ]
車両特有のトラップで、エンジンを掛けた２秒後、スモークグレネードか、ミニグレネードが起爆します。
およそ２０％の確立で、ミニグレネードになります。

	[Memo]
	イベントフックは最初の１回だけで、削除されます。

[奇妙オブジェクト]
指定されたオブジェクトを、範囲内のどこかにランダムで複数配置できます。
デフォルトでは、枯れた木、銅像、ドラム缶、破損車両などが設定されています。
壊れた車両や、ゴミ、古タイヤ、死体などを散らばらせ、いつもとは違う雰囲気を提供する事ができます。
また、建物を置くことも可能であり、町を擬似的に様変わりさせる事が可能となってます。

	[Memo]
	ランダムで空き空間に配置していますが、可能な限り建物近くを選択します。
	但し、フラット型は、道路に優先的に配置します（オイル漏れ、血溜まり、ゴミ帯など）
	他オブジェクトとは重ならないよう、オブジェクトのサイズ設定にて回避可能となってます。
	負荷的に、シミュレーションを無効にする事をお勧めします。
	（CreateSimpleObjectにて生成します。約10-20%負荷低下）

[キャンプファイヤ]
クラフトや調理、夜間の照明などに利用できる小さなキャンプファイヤを設置します。
ランダムで、建物近くに置かれます。
初期プレーヤーのための施策としてお使いください（スポーン地や村など）

[炎上オブジェクト]
町内にランダムで、炎上及び黒煙を、複数設置します。
それと共に、オブジェクトをランダムで設置できます。
車両やヘリだけでなく、建物や建築資材などのオブジェクトを設定できます。
ヘリクラッシュのダミーとしても、遠方からでも町の場所が分かります。
	
	[Memo]
	この項目に限った事ではありませんが、道路上は避けて設置されます。
	ＡＩパトロール車両の衝突を防ぐためでもあります。
	
[バンディット町ＡＩ]
建物屋内（主に窓際・出入り口）に、バンディットＡＩをランダム配置する事ができます。
建物内場所の高さが規定以上の場合に、スナイパーを配置できます。
また、パトロールの可否についての設定も可能となってます。
パトロールの際は、近場の車両や、道路、給油所を徘徊します。
クラスをカスタムとして、装備を別に設定する事ができます。
（ＡＩスキル設定に関しては、DMSアドオン設定が利用されます）
建物が無い場合は、範囲内にランダム配置されます。
プレーヤーを発見（発砲）した場合、おおよその場所にマップマークします。
（名称：GPSトラップ）

	[Memo]
	難易度は、DMS設定（random）としています。
	プレーヤーが近くにいない時は、動作を停止しています（DMS Freeze）
	マップ位置は、出来るだけ高台（ASL基準）を選択しますが、以下の場合は無視します。
	o ロケーションタイプがairfield/Airport/military baseの場合
	o 地域内高低差が10m以下の場合

	屋内位置は、マップのbuildingPositionデータを利用します。
	その中でも、近辺100m以内の道路に最も近い場所を選択します。
	これはプレーヤーとの遭遇率を上げるための配慮となってます。

	１ＡＩを１グループとして処理しています。
	（Arma3では200を超えるグループを管理できますが、一応留意ください）
	
	パトロールが許可されたＡＩは、近くの車両と道路、給油場所にウェイポイントが設定されます。最大５箇所
	（いずれも、スポーン場所からロケーション設定範囲で検索）
	ウェイポイントが少ない場合は、ロケーション基準点が利用されます。
	最後にスポーン場所に戻り、巡回します。

	カスタムクラスにすると、装備を変更できます。
	所持アイテムは、当アイテムボックスエンジンを利用します。
	（LB_LootAllFixedItems（全固定設定）は利用されません）
	（残数のあるアイテムは、ランダムとはなりません）
	
[車両湧き]
Exileサーバでの湧き車両と同様にプレーヤーが自由に利用可能なものになります。
建物近くの空き地に車両が配置され、アイテムボックスと同様に、インベントリ内にアイテムやポップタブを格納できます。
湧いてるというよりも、誰かが駐車したという趣きになってます。

	湧き位置の違い
	o サーバの車両湧き	フィールド上にランダム
	o 当アドオン車両湧き	建物付近又は、町のどこか

また、ダメージを部位毎に指定する事が可能です。
ガソリンの量指定はランダムで、下限と上限をそれぞれ指定できます。
ランダムガソリンを利用しない場合は、上限が利用されます。
建物が無い場合は、範囲内にランダム配置されます。
エンジンを掛けた際、確立で、グレネードトラップが作動します（スモーク又はミニグレネード）
（又は、GPSトラップが作動します）
ランダムで、エンジンが掛かった状態にしたり、ライトが点灯した状態にもできます。
また、町バンディットAIの巡回としても設定されます。

	[Memo]
	クラス名に”_bike”を含む場合は、ダメージ無しとなります。
	ダメージ箇所は、参考資料をご覧ください。
	車両タイプに応じて、範囲を吟味しております（建物との衝突防止）
	固定翼航空機の湧きは、おすすめできません（物理演算）

[バンディットシティ]
どこかの大きな町の一つが、バンディット達に占領されます。
グループ数を指定できます（１グループ３人）
報酬が無く、鹵獲目的の簡易ミッションのような扱いとなります。
町には、（乗れない）車両と、オブジェクトが複数置かれます。
範囲内の最も低い場所が基準点に選ばれます。

	[Memo]
	大きな町（CapitalCity）のいずれかが選択されます。
	車両をグループ数に応じて配置しますが、SimpleObjectのため利用は不可となります。

[アイアン・ミラー大尉AI]
ゾンビ菌に耐性を持った特殊なバンディットで、驚異的な治癒力を持ってます。
倒しても、また起き上がります（再生成湧き）
倒れた場合、その場所からスモークが焚かれます。
囚人服にサンタ帽、マシンガン＆グレネードを所持しています（鹵獲は出来ません）
バイポット、スコープを装備しています。
固定湧きとして、場所を指定します。１グループ複数ＡＩとして設定できます。
難易度調整などにお使いください。
プレーヤーを発見（発砲）した場合、おおよその場所にマップマークします。
死んだ場合、全ての装備品やアイテムは削除されます。リスペクトも加算されません。
そのため、プレーヤーにとって、まったくウマミがありません。
（まぼろし？ゴースト？のような扱い）

	[Memo]
	ダメージイベントの際に、体力を全開しています。
	300m程度をパトロールします。
	身を隠さず、プレーヤーを発見次第、発砲します。
	以下を装備しています。
	MMG_01_hex_F/acc_flashlight/optic_AMS_snd/bipod_02_F_hex
	ロケーションエンジン内で、対象の場所を収集しています。

[トラベラーAI]
町と町の間を移動しているＡＩを配置します。
マップ上の全てのキャピタル・シティ（大きな町）で発生し、近場の町を移動します。
（マップによりますが、およそ1～1.5Km圏内）
そのため、要所間の道路上、町に近づいたプレーヤーと遭遇しやすくなります。
１グループのＡＩ個数を設定できます。
装備は、ロケーションバンディット町ＡＩの装備設定が利用されます。
所持アイテムとポップタブが設定できます。
プレーヤーを発見（発砲）した場合、おおよその場所にマップマークします。
（名称：GPSトラップ）

	[Memo]
	CUP Takistanマップでは、大きな町（NameCityCapital）は４箇所となります。
	他マップでも、ほぼ同様かと思います。
	ウェイポイントは、となり町のNameCityのいずれかが対象になります。
	ほとんどの場合、道路が敷かれてるはずですので、道路での遭遇が想定されます。
	ロケーションエンジン内で、対象の場所を収集しています。

----------------------------------------------------------------
これより以下は、ロケーションエンジンとは関係無く、単独でも機能します。
----------------------------------------------------------------
[Exileオブジェクトランダム設置]
フレッシュウォーター又はコンクリートミキサー等のクラフト可能なオブジェクトをランダム設置します。
複数箇所を定義した上、指定の個数をランダムで選択されます。
置かれた場所には、マップマークされます。
ランダム個数の場合、ダミーのマップマークが記される事があります。
exile_3den.pboツールによるエクスポートに頼る事なく設置が出来ます。

	[Memo]
	デフォルトのオブジェクトを変更している場合は、オブジェクト名をそのまま指定してください

[カスタム看板]
マップの任意の場所に、カスタム看板を設置できます。
サーバルールやロゴなどサーバ独自色を出すことができます。
ミッションファイルに格納された画像を貼り付けテクスチャーを変更できます。
Edenエディタにて、位置と方向の数字だけメモして、設定してください。
（方向は、rotation項目の"z"の値）
看板オブジェクトでなくても、全てのオブジェクトで動作します（設定可能なオブジェクトのみ）

	[Memo]
	画像ファイルはミッションファイルに格納されている必要があります。
	Jpeg又は、Paa（Arma3独自）の形式の画像が利用できます。
	（サイズは必ず、2^xサイズでなければなりません）
	※64/128/256/512などの単位、512*256、512*512辺りが妥当
	※できればファイルサイズを20KB以下
	enableSimulationGlobal/enableRopeAttach/allowDamageなどはfalseで生成されます
	テクスチャーを変更できないオブジェクトもあります。
	（ここでは看板をお勧めします）
	テクスチャーを、複数扱えるオブジェクトの場合、１つのみとなります。

[マップ文字入れ]
マップ上の任意の場所に文字とアイコンを入れる事ができます。
また、円形ドロー（Ellipse）を行う事ができます。
色の指定やサイズの指定が可能となってます。

	[Memo]
	既存のマップマーカーの機能で実現してますので、大量に置くと負荷が掛かります。
	サイズは、縦横それぞれに倍率指定となります。
	本体又はミッション設定に依存しますので、フォントはここから選べません。

[サーバーメッセージ配信]
定期的に、全プレーヤーにメッセージを配信します。
メッセージは複数定義でき、各行毎に、切り替えて配信します。
サーバからのお知らせ、定形メッセージなどで利用ください。

	[Memo]
	配信間隔は、秒で指定できますが、実際の配信にはラグが相当含まれます。
	Arma3の仕様上、フォントが特殊で日本語は潰れてしまうので読みづらくなります。
	systemChatで配信してるため、スクロールですぐ消えてしまう場合があります。
	
[給油所の故障]
マップ上の給油所を、確率で故障させる事ができます。
0指定で無動作、1で全て故障となります。
車両等への自動給油が出来なくなりますが、クラフトは可能です。

	[Memo]
	ランダムによる確率動作

[移動トレーダー]
指定ウェイポイントを、徒歩で歩くトレーダーで、種類はランダムで選択されます。
複数トレーダーを設定した場合は、順に次ウェイポイントからの開始となります。
徒歩及び武器をしまって近づくと、取引ができるようになります。
また、プレーヤーがラジオを所持している場合、500m範囲でノイズ音声が流れます。
無敵が指定できますが、攻撃した場合、キルした場合に、ペナルティがなされます。
（リスペクトマイナス　攻撃：5%、キル：30%）
キル時は、全チャットにてプレーヤー名の報告がされます。

	[Memo]
	ウェイポイント指定の際、WESTサイドのためAIからは無視されますが、他要素には注意ください。
	（ゾンビ、道路上のパトロールなど）

-------------------------------------------------------------------------------
■■ インストール方法 / Setups
"a3_exile_lootbox.pbo"をPBOアンパックし、必要な設定を行います。
※PBOファイルの管理に、PBOManager（無料）が必要です
※当文書（readme_**.txt）は動作には不要ですので削除しても結構です

	config.sqf の編集（参照：設定方法）

再度、a3_exile_lootbox.pboにPBOパックし直します。

Exileサーバ内の、@ExileServer/addons/にPBOファイルとして配置してください。
※Exileサーバが自動的に呼び出します
サーバを稼働させ、ログ内容（.rpt）を確認します。
※Linux版の場合は、標準出力の内容

	"[LOOTBOX]::"で始まる行が、当アドオンのログになります

以下の行で、処理が完了した事になります。

	"[LOOTBOX]:: Finished! Have fun! :)"

DMSアドオン設定（config.sqf）にて、以下項目をfalseに設定してください。
AIフリーズ機能が利用できるようになります（サーバ負荷軽減）
DMS_ai_freeze_Only_DMS_AI = false;

また、当アドオンで出現するバンディットＡＩのスキル設定等は、DMS設定に依存します。

-------------------------------------------------------------------------------
■■ 設定方法 / Cooking method
配布ファイル内にはいくつかのファイルが入っており、設定編集の際は、PBOアンパックする必要があります。
config.sqfを編集します。

	主な設定項目群
	o 対象ロケーション
	o アイテムタイプ
	o トラップ関連
	o バンディットAI関連
	o 奇妙オブジェクト関連
	o 炎上オブジェクト関連
	o 車両湧き関連
	o ロケーション作成
	o トラベラーＡＩ
	o アイアン・ミラー大尉AI
	o バンディットシティ

	（非ロケーション関連）
	o カスタム看板
	o Exileオブジェクト設置
	o マップマークテキスト
	o サーバメッセージ配信
	o 給油所の故障
	o 移動トレーダー

デフォルトの設定内容は、かなり質素なアイテム構成となってます。
サーバの環境に合わせて、このアイテムボックスの立ち位置を決め、設定変更ください。
基本的には、そのままの状態で全てのマップで自動動作します。

[設定方法]
Arma3スクリプティングの記法に合わせて、注意して編集してください。
多くの部分は、一般的プログラム言語と同様の記法となってます。
間違って記述した際は、スクリプトエラーとしてログに報告されます。

	o []や{}や""などは必ず対になるようにしてください
	o コードの行末は必ず";"セミコロンで終わらなければなりません
	o 配列[]に関する設定部分では、要素間を","で区切って下さい
	（但し、最後要素の後ろには、書く必要がありません）
	o コード内にダブルバイト文字（日本語他）は利用できません
	（但しコメント内は自由に記述できます）
	o 文字コードは"UTF-8"で、改行コードは、サーバのOSに合わせてください
	（Windows：CR/LF、Linux：LF）
	o オブジェクトを指定する際は、正式なクラス名を記述してください
	o 個数を設定する部分は、必ずしも、その数分だけ適用されるものではありません
	（エラーなどで、処理が飛ばされる場合があるため。よって希望最大値となります）
	o 確立設定の項目は、0.00～1.00を記述します。1が100%となります

	[主要なファイル]
	config.sqf		設定ファイル
	putBoxes.sqf	アドイン本体
	readme_jp.txt	当文書

[./config.sqfファイル]
LB_DebugMode		デバッグモード
LB_OutputLog		ログ出力するか？
LB_PendingTime		起動時の待機秒

(1)マーカー設定
LB_MapMarker		マップ上にマークするか？
LB_MapMarkerColor	マーカー色
LB_MapMarkerType	マーカータイプ
LB_MapMarkerColorMine	（トラップ）
LB_MapMarkerTypeMine
LB_MapMarkerColorAI		（バンディットＡＩ）
LB_MapMarkerTypeAI
LB_MapMarkerColorAITr	（トラベラーＡＩ）
LB_MapMarkerTypeAITr
LB_MapMarkerColorST		（奇妙／炎上オブジェクト）
LB_MapMarkerTypeST
LB_MapMarkerColorVehicle（車両）
LB_MapMarkerTypeVehicle
※設定値は、参考資料をご覧ください
※主にデバッグ用途となります

(2)コンテナオブジェクト設定
LB_BoxObjClass_indoor[]	アイテムボックスの種類（屋外用）
LB_BoxObjClass_outdoor[]アイテムボックスの種類（屋内用）
※利用するコンテナオブジェクトを記述してください
※他アドオンの動作に支障をきたす場合があるため、事前に調査ください
（Exile_Container_SupplyBoxはヘリクラの場所決めに影響有り）

(3)ロケーションタイプ設定
LB_Locations[]		対象のロケーションタイプ
※対象となるマップロケーションタイプを指定してください
※デフォルトでは、登録されている全て町が対象となります
※優先順位があるので、個別設定は先に記述してください
※任意の町やランドマークを対象にする際は、ここに"NameLocal"を追加する必要があります
※位置情報はマップデータから取得します
※参考：https://community.bistudio.com/wiki/Location

(4)新ロケーション設定
LB_NewLocation[]	新しいロケーション設定
	1:ロケーションタイプ
	1:ロケーション名
	2:位置
	3:範囲
※任意の場所を動作対象とする場合に記述してください
（実際にロケーションとして登録されますので、他アドインの動作に注意してください）

(5)ブラックリスト設定
LB_Blacklist[]		任意の対象外エリア（[x,y,z],範囲）
※Z軸は、0を指定してください
LB_BLTrader			トレーダーからの半径(m)
LB_BLSpawnZone		スポーンゾーンからの半径(m)
LB_BLTerritory		拠点からの半径(m)
LB_BLItembox		他要素との最小距離
LB_BLBandit			他要素との最小距離
LB_BLVehicle		他要素との最小距離
※奇妙オブジェクトはブラックリストとは関係無く動作します
※車両湧きも関係しますので、スポーンゾーン設定にご注意ください

(6)ゴミアイテム設定
LB_TrashItems[]		ゴミアイテムのリスト
※貴サーバ環境にて、ゴミアイテムと思われるリストを記述してください
※空""の場合は、置換では無く削除として機能します

(7)スペシャルレアアイテム設定
LB_SRareItems[]		スペシャルレアのアイテムリスト
※貴サーバ環境にて、極上レアアイテムと思われるリストを記述してください

(8)アイテム群設定
LB_LootGroups[		アイテムリスト区分
	""				アイテムリスト区分名
	[
		[...]		固定湧きアイテム（倍率指定可）
		[...]		５０％湧きアイテム（ランダムで半分抽出）	
		[...]		レアアイテム(ランダムで１つ)
	]
]
※当アドオンの最も重要な項目となります
※クレイトボックスの容量を超えない様に注意してください
※アサルト（特にスナイパー系）は、想像以上にサイズが大きいので注意

(9)ロケーション毎設定
LB_LocationLoot[	ロケーション毎の湧き設定
	[
		""			1:対象ロケーション又は地名
		[...]
					2:範囲(m)
					3:アイテムボックスの数
					4:固定湧きの倍数（１～ｘ倍：ランダム）
					5:外・建物湧きの割合（０～１）％
					6:スペシャルレア・アイテムの湧き割合（０～１）％
					7:ポップタブの最大値（30%～ランダム）
					8:ゴミアイテムで占める割合（０～１）％
					9:バンディットAIの数（建物内湧き）
					10:道路上の地雷の個数
					11:ワイヤートラップの設置確立（０～１）％
					12:奇妙オブジェクトの設置数（０～ｘ）
					13:車両の数
					14:車両のタイプ（複数）
					15:アイテム区分の指定（複数）
	]
]
※ロケーションタイプ名の他、LocalNameの地名でも構いません
※地名を使う場合は、LB_Locationsに"NameLocal"を追加してください
※アイテムボックスやAI、車両などは様々な条件で湧かない場合があるため、多めな値をお勧めします
※多くのAIを配置する事は避けて下さい（Arma3制限のため）最大20
※ロケーション毎、車両の湧き最大数は10となっています

(10)固定アイテムボックス
LB_StaticBox		固定湧きの設定
	1:場所
	2:アイテム区分の指定（複数）
	3:固定湧きの倍数（１～ｘ倍：ランダム）
	4:スペシャルレア・アイテムの湧き割合（０～１）％
	5:ゴミアイテムで占める割合（０～１）％
	6:ポップタブの最大値（30%～ランダム）
※設定内容は、他アイテムボックス項目と同様となります

(11)バンディットＡＩ設定
LB_BanditSide		AIのサイド（east/west/resistance/civilian）
LB_BanditDifficulty	AIの難易度（DMS設定参照）
LB_BanditClass		AIの種類（カスタム又はDMS設定）
LB_BanditSniper		この高さ以上の場合スナイパー(m)
LB_BanditMove		移動可能なAI率（０～１）％
※DMSアドオンにてＡＩを生成しますので、DMS側設定に依存します
※高い場所の建物で、近隣の道路が見える場所を優先的に選択します
（但し、軍事施設や空港は建物が少ないため例外となります）
※最も高い場所が、優先的にスナイパーとなります。町１人のみ
（現段階では、適切なスナイパー位置に立ちません）
※ＡＩは基本的にその場所を離れませんが、攻撃された場合などは例外となります
[カスタムクラス時の装備設定]
ランダムで選択されます。
所持アイテムは、他アイテムと同様の設定ですが、固定湧きは無効となります。
他アドオンとの差別化を計る上、初期系、サブマシンガンをお勧めします。
LB_BanditUniforms[]
LB_BanditVests[]
LB_BanditHeadgear[]
LB_BanditWeapon[]
LB_BanditWeaponAttach[]	50%未装備
LB_BanditPistol[]
LB_BanditPistolAttach[]	50%未装備
LB_BanditAssignedItems[]
LB_BanditLauncher[]		30%未装備
LB_BanditBackpack[]		20%未装備
LB_BanditItem[]			※機能しますが、お勧めしません

LB_BanditItemGroups	格納アイテムグループ
LB_BanditItemCfg	所持アイテムリスト設定[]
	1:固定湧きの倍数（１～ｘ倍：ランダム）
	2:スペシャルレア・アイテムの湧き割合（０～１）％
	3:ゴミアイテムで占める割合（０～１）％
	※該当するアイテムボックス設定と同等となります
LB_BanditMaxPoptab	最大ポップタブ（30%～ランダム）

LB_Traveler			トラベラーAIの有無

(12)トラップ設定
LB_NearMine			アイテムボックス近くの爆発物の種類
LB_RoadMine			道路上の爆発物の種類
※複数記述でき、その場合ランダムで選択されます

(13)車両湧き設定（自転車／航空機含む）
LB_VRandomFuel		燃料ランダム(true/false)
LB_VFuelLow			最小燃料(0-1)
LB_VFuelMax			最大燃料(0-1)
LB_VBrokenParts		完全に壊れてる部位[]（複数）
LB_VDamageChance	故障割合(0-1)
LB_VDamageLow		最小ダメージ(0-1)
LB_VDamageMax		最大ダメージ(0-1)
LB_EngineOn			エンジンON(0-1)
LB_LightOn			ライトON(0-1)※Arma3バグ含
LB_VItemGroup[]		格納アイテムグループ
LB_VItemConfig		アイテムリスト設定[]
	1:固定湧きの倍数（１～ｘ倍：ランダム）
	2:スペシャルレア・アイテムの湧き割合（０～１）％
	3:ゴミアイテムで占める割合（０～１）％
	※該当するアイテムボックス設定と同等となります
LB_VPoptabMax		格納ポップタブ（30%～ランダム）
LB_Vehicles			車両オブジェクトタイプ定義[]（複数）
	1:タイプ定義名
	2:車両クラス（複数）
※Server側車両湧きや自転車湧きと併用して頂いて構いません
※Server側の車両湧きと置き換えも可能ですが、船湧きは対応してません
※通常は約10mの空間、車両タイプ名が、"poor"は5m、"air/tank/army"だと20mとなります
※自転車／クアッドバイク等は、ダメージ設定対象外となります（"_Bike_"を含む車両）
※壊れてる部位は、部位名の部分一致で調べます

(14)キャンプファイヤ設定
LB_FirePlaceObjs[]	オブジェクト

(15)奇妙オブジェクト設定
LB_StrangeObjs[]	奇妙なオブジェクトのリスト
	1:オブジェクトクラス名
	2:おおよその大きさ（半径m）
	3:道路上に設置可能か？（true/false）
	4:シミュレーションを行うか？（true/false）
※オブジェクトクラス名は、Edenエディタで調べられます（log:コピーペースト可）
※大きさ指定は、その範囲だけ空き地があれば設置可能という意味になります
※シミュレーションは、機能や動作を伴うオブジェクトの場合trueにしてください（扉やファイヤ等）
※デフォルトでは、CUP Terrains MODのオブジェクトが記述されてるので、不要な場合は削除してください

(16)炎上オブジェクト設定
LB_FlamingObjs[]	炎上させるオブジェクトのリスト

(17)トラベラー設定
LB_TravelerGrpMaxAI			１グループのＡＩ数
LB_TravelerItemGrp[]		格納アイテムグループ
LB_TravelerItemCfg			アイテムリスト設定[]
LB_TravelerPoptabMax		最大ポップタブ（30%～ランダム）

(18)アイアン・ミラー設定
アイアンマンを設置します
LB_IronMan[]
	1:場所			[]で空港か軍事施設でランダム湧き
	2:AI数

(19)Exileオブジェクトランダム設置
LB_RandomExileObj[]
	1:オブジェクト名（Land_WaterCooler_01_new_F/Exile_ConcreteMixer）
	1:場所
	2:角度（0-359）　*EdenエディタのRotation-Z値
LB_CleanWaterCount	設置数（-1で全てとなります）
LB_ConcreteMixCount	設置数（-1で全てとなります）
※設置数の指定により、ランダムで選択されます

(20)カスタム看板設定
任意の場所にカスタム看板を設置します
LB_CBillboards[]	任意設置カスタム看板設定
	1:オブジェクト
	2:場所
	3:角度（0-359）　*EdenエディタのRotation-Z値
	4:画像
※EDENエディタで位置と角度をメモしてください
※画像ファイルは、ミッションファイルに格納してください
※看板を目的としていますが、他オブジェクトも変更可能となってます
※テクスチャーを変更できるオブジェクトは決められています
※テクスチャーサイズは、２のべき乗で、jpeg又はpaaである必要があります

(21)マップ文字入れ設定
LB_Maptext[]		マップ文字設定
	1:マップ位置[x,y]
	2:マーカー名（円形描画時は""）
	3:文字又は、円形のブラシ名
	4:色
	5:サイズ（縦横スケール値） *[縦,横]

(22)サーバーメッセージ配信
LB_Bcmessage[]		メッセージ本文
LB_BcmessageTime	配信間隔（秒）

(23)バンディットシティ
LB_BCGroups			グループ数（1グループ3AI）

(24)給油所の故障
LB_BFuel_Rate		故障確率（0-1）
LB_BFuel_MapMark	マップマークの有無

(25)移動トレーダー
LB_TTraders			移動トレーダーの数
LB_TTInvincible		無敵モード
LB_TTType			トレーダーの種類（ランダム）
LB_TTMessages		メッセージの種類（ランダム）
LB_TTWayPoints		移動経路

-------------------------------------------------------------------------------
■■ ライセンス・サポートについて / License & Support
このアドオン、およびそのコンテンツはクリエイティヴ・コモンズ ( 表示 - 非営利 4.0 国際 (CC BY-NC 4.0)) によって保護されております。
このアドオン、おとびそのコンテンツを入手、複製、利用する場合は同封のライセンスに同意したとみなされます。
・著作権は放棄しておりません
・営利目的での利用は禁じます
サポートは、当方NGOでもボランティアでも慈善事業のつもりでも御座いませんので、基本的には受け付けません・・が、その時の気分で対応させて頂きます。
その辺はご了承ください。
ご利用の際は、一声頂ければ幸いです。モチベーションのアップと、さらなるバージョンアップへの布石となります。

[クリエイティヴ・コモンズ: 表示 - 非営利 4.0 国際 (CC BY-NC 4.0)
あなたは以下の条件に従う限り、自由に：
共有 — どのようなメディアやフォーマットでも資料を複製したり、再配布できます。
翻案 — 資料をリミックスしたり、改変したり、別の作品のベースにしたりできます
あなたがライセンスの条件に従っている限り、許諾者がこれらの自由を取り消すことはできません。

あなたの従うべき条件は以下の通りです。
表示 — あなたは 適切なクレジットを表示し、ライセンスへのリンクを提供し、変更があったらその旨を示さなければなりません。あなたはこれらを合理的などのような方法で行っても構いませんが、許諾者があなたやあなたの利用行為を支持していると示唆するような方法は除きます。
非営利 — あなたは営利目的でこの資料を利用してはなりません。
追加的な制約は課せません — あなたは、このライセンスが他の者に許諾することを法的に制限するようないかなる法的規定も技術的手段 も適用してはなりません。

ご注意：
あなたは、資料の中でパブリック・ドメインに属している部分に関して、あるいはあなたの利用が著作権法上の権利制限規定にもとづく場合には、ライセンスの規定に従う必要はありません。
保証は提供されていません。ライセンスはあなたの利用に必要な全ての許諾を与えないかも知れません。例えば、パブリシティ権、肖像権、人格権 などの他の諸権利はあなたがどのように資料を利用するかを制限することがあります。
ライセンス要約版: https://creativecommons.org/licenses/by-nc/4.0/deed.ja
ライセンス全文版: https://creativecommons.org/licenses/by-nc/4.0/legalcode.ja

-------------------------------------------------------------------------------
■■ たぶん開発者らしいnabekから / from Dev.nabek
遊びまくったEXILEとMODコミュニティに、小さな恩返しのつもりでアドオンを開発しました。
無論、私のサーバで実現したかった事のひとつが、これだった訳でもありますけども。
かなり後出しになってしまいましたが、世界のどこかのサーバで稼働してたら嬉しい。
この文書を、各国語版にしたいのですが、（無報酬ですが）ご協力していただけたら、幸いです。
（独語・仏語・英語・ロシア語辺りがあれば完璧なんだろうけども）

ご連絡の際は、ブログの方にコメントください。
当アドオンの開発日記も書いてます。
blog.ahh.jp (use tag search:arma3)

Discord（鯖味噌サーバ）
https://discord.gg/q96R9pe

当アドオンを利用してくれてる猛者サーバさんもいらっしゃってるようで嬉しい限りです。
当アドオンに入れるかどうか迷ってるんですが、新しいアイデアもいくつかあります。
TODO:
	o 自販機
		誰にも見られずにエロ本が買える?!
	o 大きな町の外れに、スラム街を設置
		スラム街だけでのミッションを置くとか
	o 色々なマップでの動作確認
		済：Takistan
		－：Altis
		－：Stratis
		－：Malden
		－：Tanoa
		済：Chenarus
		－：bornholm
		－：Esseker
		－：Taunus
		－：taviana
		－：tavi
		（ご報告お待ちしてます！！）

当方管理のExileサーバもよろしくなッ！
m9(　ﾟдﾟ)！！

	[サーバ名]
	[JP]鯖味噌:Saba-Miso Exile|PvP|Takistan
	[マップ]
	Takistan　（CUP Terrains mod）
	[タイプ]
	ハードコア過ぎるサバイバル、PvP
	[稼働時間]
	JST 18:00 - 24:00

※サーバ名は変更されるかもしれません
※2000円激貧PCで運用しております（詳細はブログで）
※AMD FM1-A6-3650　4Cores 3.6Ghz!!

翻訳、アイデア、技術的な多大なるご支援に大変感謝致します。
	* yukihito23
	* Losty

開発に参加してくださる方も参加募っております。
（デバッガー、アイデア企画、コーディング等）

以上です。お疲れ様でした。とても疲れた。
(；´Д｀)3...needing some smokes

-------------------------------------------------------------------------------
■■ 参考資料 / Documents
[マップマーカー色]
https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3

[マップマーカータイプ]
https://community.bistudio.com/wiki/cfgMarkers

[ロケーションタイプ]
https://community.bistudio.com/wiki/Location

[爆発物]
ATMine/APERSMine/APERSBoundingMine/SLAMDirectionalMine/APERSTripMine
SatchelCharge_F/DemoCharge_F/Claymore_F/IEDUrbanBig_F/IEDLandBig_F/IEDUrbanSmall_F/IEDLandSmall_F
UnderwaterMine/UnderwaterMineAB/UnderwaterMinePDM
https://community.bistudio.com/wiki/Arma_CfgVehicles_Other
※検索するとオブジェクト画像が見れます(Ctrl+F)

[アイテム種類]
EXILEミッションファイルのconfig.cppを参考に記述してください。
（トレーダー辺りが一覧で見易いかと思います）

[車両ダメージ基本部位]
HitEngine (engine #1)／HitEngine2 (engine #2)／HitEngine3 (engine #3)／HitHRotor (main rotor)／HitVRotor (tail rotor)／HitBatteries (electrical systems)／HitLight (landing light)／HitHydraulics (entire hydraulics system)／HitTransmission (engine transmission)／HitGear (landing gear)／HitFuel (all fuel tanks)／HitHStabilizerL1 (first left horizontal stabilizer)／HitHStabilizerR1 (first right horizontal stabilizer)／HitVStabilizer1 (first vertical stabilizer)／HitTail (tail boom)／HitPitotTube (all pitot tubes)／HitStaticPort (all static ports)／HitStarter1 (starter for engine #1)／HitStarter2 (starter for engine #2)／HitStarter3 (starter for engine #3)／HitAvionics／HitHull／HitMissiles／HitRGlass／HitLGlass／HitGlass1／HitGlass2／HitGlass3／HitGlass4／HitGlass5／HitGlass6
※オブジェクトによって部位は変わります

[人間ダメージ部位]
HitFace／HitNeck／HitHead／HitPelvis／HitAbdomen／HitDiaphragm／HitChest／HitBody／HitArms／HitHands／HitLegs
neck／head／pelvis／spine1／spine2／spine3／body／hands／legs
※当アドオンには関係ない資料

[Arma3内蔵サウンドファイル]
Arma 3: SoundFiles
https://community.bistudio.com/wiki/Arma_3:_SoundFiles
※座標
ASL：Z軸が、水面基準
ATL：Z軸が、地形基準（Z軸は基本使用しない）、橋などは浮いてる扱い
AGL：Z軸が、地形基準（地面に接しない場合など、建物の上とかオブジェクトの上等）
EDENのプロパティでは、AGL座標で表示されているため、海に設置する場合は注意
内部コマンドによっては、それぞれを使い分けないといけない。

-------------------------------------------------------------------------------
■■ 更新履歴 / Change logs
2019/05/18 V1.5
著作権利の明確化（CC-NC）、給油所のランダム故障、移動トレーダー、バンディットAIリスポーン
AI湧き位置などの微調整
アイテムボックス固定湧きにランダム要素追加、定期的サーバ情報ログ（StatusReporter）
MOD依存（CUP）の回避設定、全体的な高速化、全体的な整理見直し、ログ内容を見易く改変
無駄なコードファイルを減らして、メインコードに統合

2019/02/13 V1.4
バンディットシティ機能の追加、ランダムExileオブジェクト機能増加（コンクリートミキサー、トレーダー、ロッカー）
Ammoマガジンの残弾数をランダム（マッチ等の残数アイテム全て）、ゴミアイテムによるアイテム削除機能の追加
建物のドアをランダムで開く、アイアン・ミラーAI湧きポイント調整、バンディットのデフォ設定見直し
町＆トラベラーAIのウェイポイントをセーフゾーン内に設定しないように修正
マップテキスト機能に円形ドロー追加、コンクリートミキサー設置機能、マップ上テキスト配置に文字のみを追加
箱に、Exile_Item_OldChestKitを追加、バンディットAIに臆病度をランダムで適用（0-0.3）
設定デフォルト値の調整、エロ本（はずれ）LOOT設定の追加、ソースコードの整理、高速化、当文書加筆
アイアンマンの名称をアイアンミラーに変更

2018/05/17 V1.3
アイアンマン（無敵AI）機能追加、GPSトラップ機能追加、グレネードトラップ機能追加、サーバーメッセージ配信機能追加
キャンプファイヤー設置機能追加、マップ文字入れ機能追加、水汲み場設置機能追加
"Exile_Magazine_10Rnd_9x39"（スナイパー用）を固定湧きにしていたので移動
ロケーション数と処理位置をログ出力、Readmeの加筆修正

2018/04/21 V1.2
車両湧きで、稀に接触があるのを修正、奇妙オブジェクトの負荷率低下（SimpleObject化）
AI動作バグ取り、AIパトロール機能の追加＆調整、炎上オブジェクト機能の追加、ログを見やすく若干修正
アイテムボックス生成時バグ修正、オリジナルロケーション作成機能の追加
地雷設置バグ修正、カスタム看板機能の追加、アイテムボックス固定湧き機能の追加
ＡＩカスタム装備の追加（selectAIGear.sqfファイルの追加）
デフォルト設定値の見直し、全ファイル改行コードをLFに更新
トラベラーAI機能の追加

2018/04/10 V1.1 据え置き
デフォルト設定値の記述ミス、Readmeの加筆修正

2018/04/03 V1.1
AIリーダー忘れ、スナイパー設定追加、ロケーション位置自動調整、ログ出力周り改変、config見やすく改変、起動待機の追加
コンテナ許容量エラーチェック、コンテナへアイテム追加時コード書き直し、奇妙オブジェクトシミュレーションフラグ追加
ポップタブ計算方法変更、セーフエリアの除外追加（トレーダー／スポーン／各拠点）、アイテム50%集計の改変
車両湧きの追加、負荷が掛かりそうな処理後にウェイト挿入、アイテムボックス及びＡＩの沸き場所の調整、各湧き要素の位置調整
総当たりデバッグ作業

orz..