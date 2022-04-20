self.addEventListener("install", (e) => {
    e.waitUntil(
      caches.open("static").then((cache) => {
        return cache.addAll([
          "./header.jsp",
          "./footer.jsp",
          "./assets/css/style.css",
          "./assets/img/logo.png",
          "./assets/img/apple-touch-icon.png",
        ]);
      })
    );
  });
  
  self.addEventListener("fetch", (e) => {
    e.respondWith(
      caches.match(e.request).then((response) => {
        return response || fetch(e.request);
      })
    );
  });
  