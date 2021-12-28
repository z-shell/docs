
  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
	  metadata: [{name: 'twitter:card', content: 'summary'}],
      algolia: {
        appId: '9MWZG6YTZH',
        apiKey: '25296a50114a93564278103ec825b069',
        indexName: 'dev-z-shell',
        contextualSearch: true,
      },
      announcementBar: {
        id: 'announcementBar-2',
        content: `⭐️ If you like Z-Shell ZI, give it a star on <a target="_blank" rel="noopener noreferrer" href="https://github.com/z-shell/zi">GitHub</a>`,
      },
	  liveCodeBlock: {
        playgroundPosition: 'bottom',
		  },
	  switchConfig: {
        darkIcon: '🌙',
        darkIconStyle: {
          marginLeft: '2px',
        },
	  },
      hideableSidebar: true,
      colorMode: {
        defaultMode: 'dark',
        disableSwitch: false,
        respectPrefersColorScheme: true,
	  navbar: {
        hideOnScroll: true,
		title: '❮ ZI ❯',
        logo: {
          alt: 'ZI Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Wiki',
          }
//          {to: '/blog', label: 'Blog', position: 'left'},
//          {
//            href: 'https://github.com/z-shell/zi',
//            label: 'GitHub',
//            position: 'right',
//          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Knowledge base:',
            items: [
              {
                label: 'ZI Wiki',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Github Discussions',
                href: 'https://github.com/z-shell/zi/discussions',
              },
            ],
          },
          {
            title: 'More',
            items: [
//             {
//                label: 'Blog',
//                to: '/blog',
//              },
              {
                label: 'GitHub',
                href: 'https://github.com/z-shell/zi',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Z-Shell ZI, Community.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
		  additionalLanguages: ['shell-session', 'bash', 'vim', 'git']
		},
    }),
};

module.exports = config;
