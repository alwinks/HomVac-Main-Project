window.addEventListener('beforeinstallprompt', (e) => {
    // Prevent the mini-infobar from appearing on mobile.
    e.preventDefault();
    console.log('👍', 'beforeinstallprompt', e);
    // Stash the event so it can be triggered later.
    window.deferredPrompt = e;
    // Remove the 'hidden' class from the install button container.
    divInstall.classList.toggle('hidden', false);
});

butInstall.addEventListener('click', async () => {
    console.log('👍', 'butInstall-clicked');
    const promptEvent = window.deferredPrompt;
    if (!promptEvent) {
        // The deferred prompt isn't available.
        return;
    }
    // Show the install prompt.
    promptEvent.prompt();
    // Log the result
    const result = await promptEvent.userChoice;
    console.log('👍', 'userChoice', result);
    // Reset the deferred prompt variable, since
    // prompt() can only be called once.
    window.deferredPrompt = null;
    // Hide the install button.
    divInstall.classList.toggle('hidden', true);
});

window.addEventListener('appinstalled', (e) => {
    console.log('👍', 'appinstalled', e);
    // Clear the deferredPrompt so it can be garbage collected
    window.deferredPrompt = null;
});

self.addEventListener("install", (e) => {
    e.waitUntil(
            caches.open("static").then((cache) => {
        return cache.addAll([
            "./header.jsp",
            "./footer.jsp",
            "./style.css",
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
