const CACHE='bpm-bible-v10-kjva-1769';
const APP=['./','./index.html','./manifest.json','./logo.png','./apple-touch-icon.png','./icon-192.png','./icon-512.png','./favicon-32.png'];
self.addEventListener('install',e=>e.waitUntil(
  caches.open(CACHE).then(c=>Promise.all(APP.map(u=>fetch(new Request(u,{cache:'reload'})).then(r=>r.ok?c.put(u,r):null).catch(()=>null)))).then(()=>self.skipWaiting())
));
self.addEventListener('activate',e=>e.waitUntil(
  caches.keys().then(keys=>Promise.all(keys.filter(k=>k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim())
));
function store(req,res){if(res&&res.ok){const c=res.clone();caches.open(CACHE).then(k=>k.put(req,c));}return res;}
self.addEventListener('fetch',e=>{
  const u=new URL(e.request.url);
  if(e.request.method!=='GET')return;
  // App files: network first (so updates always arrive), cached copy when offline
  if(u.origin===location.origin){
    e.respondWith(fetch(e.request).then(r=>store(e.request,r)).catch(()=>caches.match(e.request,{ignoreSearch:true}).then(r=>r||caches.match('./index.html'))));
    return;
  }
  // Bible text: cache first (large file, rarely changes)
  if(u.hostname==='api.getbible.net'&&u.pathname==='/v2/kjva.json'){
    e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request).then(x=>store(e.request,x))));
  }
});
