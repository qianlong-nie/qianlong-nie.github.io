// 中 / EN 切换：点击按钮切换 <html data-lang>，并记住选择；同时更新页面标题。
(function () {
    var root = document.documentElement;
    var titleEl = document.querySelector('title');

    function apply(lang) {
        root.setAttribute('data-lang', lang);
        root.setAttribute('lang', lang === 'zh' ? 'zh-CN' : 'en');
        if (titleEl && titleEl.getAttribute('data-' + lang)) {
            document.title = titleEl.getAttribute('data-' + lang);
        }
    }

    apply(root.getAttribute('data-lang') || 'zh');

    document.addEventListener('click', function (e) {
        if (!e.target.closest('#lang-toggle')) return;
        var next = root.getAttribute('data-lang') === 'zh' ? 'en' : 'zh';
        apply(next);
        try { localStorage.setItem('lang', next); } catch (err) {}
    });
})();
