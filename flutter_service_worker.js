'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ef4855cd300b938574864aec5fca5891",
"version.json": "2a2c47bae25c99d743fb55f461cefe8e",
"index.html": "6912960007b2e554e20607ef234189c8",
"/": "6912960007b2e554e20607ef234189c8",
"main.dart.js": "79215503aec0ab3337480108c0bcb144",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "c5d55801a4e8f0ce989f2479d7735772",
"icons/Icon-192.png": "1d1e0b368d766975c6d65e4552fd355c",
"icons/Icon-maskable-192.png": "1d1e0b368d766975c6d65e4552fd355c",
"icons/Icon-maskable-512.png": "8aa14612766930b4038bd1e658ea300c",
"icons/Icon-512.png": "8aa14612766930b4038bd1e658ea300c",
"manifest.json": "1e7de26c08152c82ea4fbf870b0ccdfb",
".git/config": "c9c7a99f0b21bb07c014c38c9b5c7d4b",
".git/objects/0d/f4caf5515571b5a39b1cef5e41f929f18ba7a6": "74b44cc8c8420cc2c91fdc728bf6a6d6",
".git/objects/66/0b0b440d206e34ac6cbc89e13c4c1062a0dc8a": "a9e859027aca656c4f7fb8aac47689f2",
".git/objects/3e/d0ddd7136a48520910e7e4bf665362facd60d4": "c8322669a78b5f07c75b1decdc05718d",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/68/982426933313bf45931dd2c7193a882b6680fe": "7ccd15604452dc335df392bce1600a2b",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/03/e736613a750cdd8d4f54bca28844e2d13257cb": "bd840ac16c281d81f004822f55e1db62",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/58/c7d4801ed17db24adaffcaf8988e55b9752a7f": "40e43d56fcd0fdc6408c802ee9e50d6a",
".git/objects/58/73ce0312813bdb76ea32a7c6311c69a4809c40": "8564fbf31ed72ff2cab80eae9544216b",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/05/91be536e621f62e9469e4866af3527cef7d204": "4a4a017a0ddd31e290b952a0af806f52",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ac/2269614158291eea6f46ce81e85fe9710849d1": "986f7c10b100ea342ff065184a15a04c",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/bc/36bcc2427a84e29e61ea7b634024072c04b206": "08cd2a4fd07be093532cedca2675ee60",
".git/objects/e2/aa45a23ba4e46ee20b9808fb069542f9815a12": "051d4543bac8b5e690df355869b334e9",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f3/7d4876562843c1c6b3d63293b165533c39f33e": "3a784174e2cef1f5a2283d0c624c51fd",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f2/ab6d3a67986da8a7319cb898734402e6e7bf78": "081bcf154ff95ffeea68026a54b0e712",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/27/c06f912e4ceca78202d0d0f9f1e4581eca3bed": "95c02a28e3e7bebcfedc7e6775680fee",
".git/objects/7d/91d7a0c823e1d9e18b221e28eb6a93c91e5a2b": "9a5c0235e02412eaf939fd7a4f9eabfc",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/74/c726e32781bc2c0a83170f6800c0ef4cb9ddcf": "69a43282cb8038fd0577dc0529e5d6cb",
".git/objects/4d/1adebf81c4d8b5b8ff1b4b50f5e51653deeb64": "664870fb3f8625518f79cd78693b2319",
".git/objects/44/a6547768631398addb3333a551feb8464f6c49": "5683a4dd695f5fe2458707732a488199",
".git/objects/2a/d194dd3f1d6e1e785c24e4657eb9976f2ea57d": "d54032dff824e0c09cde5144b133af76",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6b/b161d84323b7a4f2a9351246ce1bee37d4280b": "1a58b8552020866c7674758423db3947",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/00/559eeb290fb8036f10633ff0640447d827b27c": "7fbd4486d5ea862eb2c1d2a07b06b395",
".git/objects/00/9956833774250f98e672a10be3e3c6c50d591a": "12a5213207a2512697f7f19ffb5b7b97",
".git/objects/6e/4860fc07b47650c48bdf17170447273231e0a8": "147735935080c1b8cc5162cab7c243c6",
".git/objects/9a/fe41e766bbb921f3103dcf7a8435e2a51d0d6c": "a75741e363925dadab1b592ccba2b1fa",
".git/objects/31/6d04bbb3aee1be8afa76a27f59613f42e384ad": "53913e77252a2c0dad9a80cc8e5f7cce",
".git/objects/91/378e058546eb608f2f8a9bbed9f67766befe35": "1309175dc25537a0c5a3f6f48f64d66e",
".git/objects/65/25cf9c0e7964679c4dbbcd7b7cadb42a96ea79": "61027696eaa7c312b7f23dfed6e40ac2",
".git/objects/96/7abbd9560159fe064286aa0fc81bedf08d08a4": "4679361076c0031c20e614937d8897a9",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/54/4eac5e065751cb031a403e82eabc5f5770b00d": "d5eb076cfb4cd32e4b3235f9af7ee9ab",
".git/objects/5e/b68840370e2790b14236987be8dc9a7ef05b5c": "670b0f36ddf0c7300d42275c3a19a9b5",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/08/7067b9f5b7eb1fb12918966d95343bb7fee252": "2e89ad68fbcb3328054ef0e91166f604",
".git/objects/52/edba1684f0618f5a336c6934665982610ca769": "1abf791049e899e339b04d4d004ef873",
".git/objects/52/5e265d3fecf65a43ae9da7ec76b0a12c0272c2": "032809ccad7fecfa31f60a4d401db49d",
".git/objects/97/ac0ff8e556d75f8e2e54d75c929deb7dbf5bb7": "48d3f04a47400f5e1f2054e390935e35",
".git/objects/97/72421b496e915b4f24eb874c9362ced36d2808": "6978160c6d43eb6ae7b07be87d0c86b5",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/3b5908ede20133a03053e5d5061bc6e4002a3f": "881e8367dd32d94abffd710328e80451",
".git/objects/d2/3c7bc9cdc81957bdf69355894633d28811e898": "ee5bd853e50ac0fce751c23300dd1174",
".git/objects/a8/6ff875ab36b60c6576f3b553cd1ddbc3f3490d": "143f052034867db436f3523bf6efa6ae",
".git/objects/b0/5ce8ff7f2f806866cedd2907115d0f1524fdcf": "fc1f1747e3d240108a5e54e251e063b7",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/b9/318eae23f91ba0187d51e83769365b530c91db": "65f2667fa0c0d30b3f1f2e623a00697d",
".git/objects/e1/b05e3feff9f7840f6f55cf3f56454654261844": "6e0cd83f83179707ee2a98974fcc6251",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/f0/22cffe9ca6ed9aca86bf71adaea8f2fbbaa741": "64edd660cfce51c73e73ba8e588a539c",
".git/objects/ff/120c3f4d84a40c90dd491fe716140243204c25": "fea19e6234d7113d5d073b58202fb944",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/cb/6b7a6137f8e01d986294349a6bc2fadc6d1849": "9df7d09456db8013ef6b3c4b23309f7a",
".git/objects/cb/9f60d01e4fe2465aa04484f0166f3bfe6c8539": "caeef059e805d6a68399eb3202ee1d0b",
".git/objects/f8/e012d852ad270c2a5a44712e66cdf2f34eafbd": "3fd72efa57717466b543eebf37781679",
".git/objects/46/73671b2dad4e43cde8d5ef1e85f5c5192ecb5b": "e8132eec89a229290ab035d7b8961071",
".git/objects/79/4c169454938484516b0c1189ea86cef4e38fe3": "819c80f97e6f67e45586c0f231eae792",
".git/objects/70/d46f4631de09e309d3a54bcc4368ce08c789b1": "6bea5699d1a636800be8fff021522d6e",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/49/cc28573dc6004b993c086a991d6e1c65fe4914": "e75eafe2a8652aeb63948d2d4c4afd6c",
".git/objects/2e/e60e7005453665ebb60eada7dc52408563dc4e": "d8ec1f25174fc9e1cf8d11cec3ab0c03",
".git/HEAD": "03295ccaa61e07c68fd300fd36a46970",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "23231b5c743ceb4c20dd37d2c3bb1c06",
".git/logs/refs/heads/web-build": "23231b5c743ceb4c20dd37d2c3bb1c06",
".git/logs/refs/remotes/origin/web-build": "1ef7d654fe30546578a155052cffcee1",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
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
".git/refs/heads/web-build": "f7f2d17e73a28cb3d8e1734eacd376dd",
".git/refs/remotes/origin/web-build": "f7f2d17e73a28cb3d8e1734eacd376dd",
".git/index": "b8fefc7e8acdc75482f17be7abf0f732",
".git/COMMIT_EDITMSG": "f34a750b1b6fc603c87ccb2c0a006419",
"assets/NOTICES": "c762561bd0491c55fb4d2be1cf88268c",
"assets/FontManifest.json": "0f27435495838cf9b0dbd69f69669edb",
"assets/AssetManifest.bin.json": "4f5a12a9c10090e4a5f4033137b618fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "16bb427ec375dfc13f9e806575266800",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/smartinnotech_logo.png": "b7803310f654a72e81b9fdf3eb01c3ec",
"assets/assets/images/logo.png": "1763c514828fa9265017fd0a9851c04b",
"assets/assets/images/wellcare_logo.jpeg": "86eedad8c744c5af3c176ba8862b6b93",
"assets/assets/images/personal1.JPG": "a187c2282cc6924989a01169899e5369",
"assets/assets/images/southtelecom_logo.png": "94d3dd45620cecc39becce94e8263f5e",
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
"assets/assets/files/dongnguyen-cv.pdf": "e1cace339474807de224515077685a65",
"assets/assets/font/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/font/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/font/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/font/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/font/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/font/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
