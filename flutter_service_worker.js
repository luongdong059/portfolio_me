'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "2a2c47bae25c99d743fb55f461cefe8e",
"index.html": "a6d85eb3fc5d978bf256458d3563671d",
"/": "a6d85eb3fc5d978bf256458d3563671d",
"main.dart.js": "4d44d3c9fde6723db94975a14102e780",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "c5d55801a4e8f0ce989f2479d7735772",
"icons/Icon-192.png": "1d1e0b368d766975c6d65e4552fd355c",
"icons/Icon-maskable-192.png": "1d1e0b368d766975c6d65e4552fd355c",
"icons/Icon-maskable-512.png": "8aa14612766930b4038bd1e658ea300c",
"icons/Icon-512.png": "8aa14612766930b4038bd1e658ea300c",
"manifest.json": "1e7de26c08152c82ea4fbf870b0ccdfb",
".git/config": "b615df1e478bd5eb0d85f5335accc483",
".git/objects/92/eab450609b7dc5d076ddf6c8416de8209373e0": "9b3d4cb7f5916a87f36a18b466ea7ac4",
".git/objects/66/0b0b440d206e34ac6cbc89e13c4c1062a0dc8a": "a9e859027aca656c4f7fb8aac47689f2",
".git/objects/66/1b894685c66acf34a65a24affc3a615493542d": "859553dcdb8f653bc58c3f467dfc988a",
".git/objects/03/0cf45ce3d7be1216aca1c6068e1ae61a81d532": "deea76417655f8e996ce2f821cf7e4fd",
".git/objects/03/e736613a750cdd8d4f54bca28844e2d13257cb": "bd840ac16c281d81f004822f55e1db62",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/69/dd618354fa4dade8a26e0fd18f5e87dd079236": "8cc17911af57a5f6dc0b9ee255bb1a93",
".git/objects/58/73ce0312813bdb76ea32a7c6311c69a4809c40": "8564fbf31ed72ff2cab80eae9544216b",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/0e/55e245ea92a3cac602cbe65194ed167fa57224": "1d844a3886a1b620f3ec11b0ba33a776",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/5f/b97987f5ed7bb2a1826e5f944eaa0f6773f0df": "1711a558f9ade47a2ac89ab436a1e8bd",
".git/objects/ad/4c0ba9842f4de544316a62269732d33f652961": "d2648c4f7ac6a01d24dedabffef3980b",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/b3/3819935179f94aac67ab19a9071348a81b620c": "0f91ce155cf7be20d5288d86cfa9a668",
".git/objects/da/5c469614a5ec8339f5a4058392da60049791fa": "3de2313006ceb483bbb6e2c9840a6123",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/bc/36bcc2427a84e29e61ea7b634024072c04b206": "08cd2a4fd07be093532cedca2675ee60",
".git/objects/e2/bae3d8eeb91cabd886be3527bf29036d76c32c": "e561082be3002e2b7bb138bd8f035982",
".git/objects/e2/aa45a23ba4e46ee20b9808fb069542f9815a12": "051d4543bac8b5e690df355869b334e9",
".git/objects/e2/06775662cc9e3ab8e1381bcef584629bb4ca9d": "459bf55050c9f4897903b2dbb3785ba1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/5475d9c10b88194a89e1ee5d4546d8ea69242e": "05b10ba8d0d2f22ccb7001f7175a689c",
".git/objects/f2/ab6d3a67986da8a7319cb898734402e6e7bf78": "081bcf154ff95ffeea68026a54b0e712",
".git/objects/ca/1f4e7566a080cc2a67d572d00616d606178f20": "553c036604c7fc6604d602ea0435368c",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/18/78fd3318d30475f9c0a228d1f6228971a6e31d": "2489774fd163903762c67c94bb115264",
".git/objects/27/c06f912e4ceca78202d0d0f9f1e4581eca3bed": "95c02a28e3e7bebcfedc7e6775680fee",
".git/objects/4b/08c92a6448f807045994c6de22d8ee9093aaab": "73d0aae290bed3c22142aa1a7a3ba56f",
".git/objects/11/4b0a883dc6e022aac6f9a4e28ac48dda6a556f": "d34a8e0139c91d9fa077431ca2843f1e",
".git/objects/11/a04697c970b8ba0a9ccf10138386a50d1e76b9": "c688e2cf3b806ab67945a5053285a6a7",
".git/objects/29/06342eff5a3b027c96669e6861dd445e8ea961": "ce1178a7d07a2922b25083a5c4ad6e36",
".git/objects/74/c726e32781bc2c0a83170f6800c0ef4cb9ddcf": "69a43282cb8038fd0577dc0529e5d6cb",
".git/objects/74/bc10700ff79c7fd9c62fced465651cf6079dc2": "8669a7b08e2416f92542589e6592a71b",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "e3695ae5742d7e56a9c696f82745288d",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/44/a6547768631398addb3333a551feb8464f6c49": "5683a4dd695f5fe2458707732a488199",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/9f/4df785763fe1fe8987557860cc10eca55ef6ae": "c79e3bbdcc2bf27116ec0aabb07ba582",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6b/b161d84323b7a4f2a9351246ce1bee37d4280b": "1a58b8552020866c7674758423db3947",
".git/objects/00/b0960dd3eeefee5e2f22af347dad85a4e4356a": "cefb711acc9e3b4b36498211f91fedf9",
".git/objects/00/559eeb290fb8036f10633ff0640447d827b27c": "7fbd4486d5ea862eb2c1d2a07b06b395",
".git/objects/6e/2d1383b08d4d2e5632c7b392d98ffc95149f0d": "9e9ec668e2d5d895e98b539b9f7471c5",
".git/objects/6e/4860fc07b47650c48bdf17170447273231e0a8": "147735935080c1b8cc5162cab7c243c6",
".git/objects/9a/fe41e766bbb921f3103dcf7a8435e2a51d0d6c": "a75741e363925dadab1b592ccba2b1fa",
".git/objects/5c/c6b490a6d2abcb3104cd22d8091b93110b3719": "d4c8ffaa5603b7e1787b74cceb0cd761",
".git/objects/31/6d04bbb3aee1be8afa76a27f59613f42e384ad": "53913e77252a2c0dad9a80cc8e5f7cce",
".git/objects/96/e3290219ddb6a26d8b1670c43eabb2d0d46cbc": "4990fa4ba167e3615834acbc25054238",
".git/objects/3a/bd8069ac6d2c16c9515edab67980b4c1f34760": "24f5d422254c3b080baaa7a218662e95",
".git/objects/5e/6b77e7e65918cd11ff8fecb2829c32dfbb4bee": "b7ea290279a378e8b72bd58fe5c2abf1",
".git/objects/08/91c99dce1e0345f2825cc435125092e8606e24": "298651121ee9a8998f20f46324ca6a64",
".git/objects/52/edba1684f0618f5a336c6934665982610ca769": "1abf791049e899e339b04d4d004ef873",
".git/objects/52/5e265d3fecf65a43ae9da7ec76b0a12c0272c2": "032809ccad7fecfa31f60a4d401db49d",
".git/objects/97/72421b496e915b4f24eb874c9362ced36d2808": "6978160c6d43eb6ae7b07be87d0c86b5",
".git/objects/d3/e75b7a90ee12029a0ee6db3d7d6bbfe63be8e8": "1c585fd0a5b230ea013f92aea30dd179",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/ba/3b5908ede20133a03053e5d5061bc6e4002a3f": "881e8367dd32d94abffd710328e80451",
".git/objects/d5/80ce749ea55b12b92f5db7747290419c975070": "8b0329dbc6565154a5434e6a0f898fdb",
".git/objects/d2/cd776d8bd9c9d45e49a2f253063020e842d2d7": "f34115c580d328db7622855dc6599a8b",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b0/5ce8ff7f2f806866cedd2907115d0f1524fdcf": "fc1f1747e3d240108a5e54e251e063b7",
".git/objects/b0/4c398fcab0144837af2475953543bad8bb8115": "87d3816a0803cf83db23bf6f248a39a1",
".git/objects/a6/97c2efc629f3322245afb1ff384a74e5c0aa9b": "24b81c37c99df9ca4d2120441fca113b",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/318eae23f91ba0187d51e83769365b530c91db": "65f2667fa0c0d30b3f1f2e623a00697d",
".git/objects/e1/b05e3feff9f7840f6f55cf3f56454654261844": "6e0cd83f83179707ee2a98974fcc6251",
".git/objects/e6/fc91299f61bc65959658ccac31f3dc1538a5a7": "a1f2e9a7c11001b76ef315b924e07a20",
".git/objects/f0/22cffe9ca6ed9aca86bf71adaea8f2fbbaa741": "64edd660cfce51c73e73ba8e588a539c",
".git/objects/f6/e4e1f074230119da2680b437ef3cc7c1205868": "48e0a84457cbc24c5d1cbd183d04f9e1",
".git/objects/f8/e012d852ad270c2a5a44712e66cdf2f34eafbd": "3fd72efa57717466b543eebf37781679",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/73671b2dad4e43cde8d5ef1e85f5c5192ecb5b": "e8132eec89a229290ab035d7b8961071",
".git/objects/79/4a78ad1c76544e4f3e032e6eae3767d3340da1": "115a536167cba018c352a61873a3ea70",
".git/objects/79/0c32964f2d8420cd488aba59d0821656e37222": "255b943f0134c8923ac4a0f86784c3a2",
".git/objects/2d/fd99609b738e235bcfb9e426c5f5864f843008": "cb1c798cc94452c468ffd3a28f30c259",
".git/objects/41/5c059c8094b888b0159fdedfd4e3cb08a8028e": "86914685ccd40e82a7fe5b70459fb9f7",
".git/objects/1b/68594304185ec19e0920edec24a9a305db6c5b": "8e1e31e11dfae57e193d30e55c72db39",
".git/objects/77/be2a35595bb5975311d202d2b36e1e768b2142": "2fa5af7d7bf84c6a1ded2e3f257ff780",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/70/2338113f0e516e9abec965d977b5dc3ead3f40": "477d01424c1d990e7918f00c55afa2be",
".git/objects/70/d46f4631de09e309d3a54bcc4368ce08c789b1": "6bea5699d1a636800be8fff021522d6e",
".git/objects/1e/5cc2ce65d3bd163cd68024adc4469ec9f2b283": "78eeef070cb2c78cafe80d9d128e6110",
".git/objects/4a/33c056b21d6d277dccb6c00f0b0a352b53c1f7": "7f0f5dcf056449caf14d011f57a89325",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/15/ccf3acdf52eeb9feefe289f1345cb06b8cdcd8": "183a9a53114665a1b6201121d3291d8f",
".git/objects/8c/99266130a89547b4344f47e08aacad473b14e0": "41375232ceba14f47b99f9d83708cb79",
".git/objects/85/e7c44eace60c82b7ee7d259b165915920d2b3f": "78a4630d00bb590a8325454f80ac62b3",
".git/objects/76/0ff6af40e4946e3b2734c0e69a6e186ab4d8f4": "009b8f1268bb6c384d233bd88764e6f8",
".git/objects/1c/cdd9be79d5b00d2f1344f237733e550397bdc6": "5bd7cf33425f7f20db597d6facb116b3",
".git/objects/49/cc28573dc6004b993c086a991d6e1c65fe4914": "e75eafe2a8652aeb63948d2d4c4afd6c",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/13/f50d90679d552a8a2f9cf37fcd6e0b8d8c3087": "fa543a8c6e43bf67d600ea05fef15664",
".git/HEAD": "03295ccaa61e07c68fd300fd36a46970",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "935bed5b83c59233b9e38609df421f50",
".git/logs/refs/heads/web-build": "673279f11d158d8cf9c3532020e5f9f3",
".git/logs/refs/remotes/origin/web-build": "dfa73df871be1229c559e9c154ab24c0",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/web-build": "655e48cb8f5d95f8ff06a4c20c0446ca",
".git/refs/remotes/origin/web-build": "655e48cb8f5d95f8ff06a4c20c0446ca",
".git/index": "911053c30f0cfba05543fc3049d78d33",
".git/COMMIT_EDITMSG": "3016317ea19bb2aab9572b0cfb0ce4fa",
"assets/AssetManifest.json": "51d184aaf52293c19fe16d250436fe68",
"assets/NOTICES": "87e0b811463335554ca926e12fa1a7a9",
"assets/FontManifest.json": "0f27435495838cf9b0dbd69f69669edb",
"assets/AssetManifest.bin.json": "38a863145f1ace11db7ae47e03205bc7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "12fa77ce235f3e458bb6145d8ab4afdd",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/smartinnotech_logo.png": "b7803310f654a72e81b9fdf3eb01c3ec",
"assets/assets/images/logo.png": "1763c514828fa9265017fd0a9851c04b",
"assets/assets/images/wellcare_logo.jpeg": "86eedad8c744c5af3c176ba8862b6b93",
"assets/assets/images/personal1.JPG": "a187c2282cc6924989a01169899e5369",
"assets/assets/images/personal.JPG": "ee3cdb1bd6e260f27f6882714341f067",
"assets/assets/icons/git.png": "2c4402875cb955c348b1244d01ddf06d",
"assets/assets/icons/address.png": "58d0590a0dc9e184ca58997697c1ab04",
"assets/assets/icons/icon-figma.webp": "726a0c507be7528686f05e423dce936b",
"assets/assets/icons/github.png": "90d2f7677dcdc3259b79a7465d01d3dd",
"assets/assets/icons/icon-flutter.png": "9961013a2fe6fde438876536ea6b9081",
"assets/assets/icons/icon-phone.png": "d6ab16270c64c8571b30d19231f88b2e",
"assets/assets/icons/figma.png": "b6c893683c6d6180ac92b80d302136e5",
"assets/assets/icons/sign.png": "5cf411cb565ab61b4aaa823066c313d3",
"assets/assets/icons/favicon.png": "8ced30f261dd7101b149b80b607e7b98",
"assets/assets/icons/icon-copy.png": "e6a2191c4a089012d57f64bfd1cb7c30",
"assets/assets/icons/twitter.png": "4b7b687ad4d21dd1f8af57739689c49c",
"assets/assets/icons/icon-email.png": "fa119098ec49e9c64777e116a811ecd3",
"assets/assets/font/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/font/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/font/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/font/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/font/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/font/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
