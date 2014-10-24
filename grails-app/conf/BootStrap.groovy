import com.rolex.blog.Navigation
import com.rolex.blog.Post
import com.rolex.blog.Reply
import com.rolex.blog.Tag
import com.rolex.blog.User

class BootStrap {

    def init = { servletContext ->
        def user1 = new User(username: 'rolex',password: '123'.encodeAsPassword(),email: 'admin@gmail.com',active: 1)
        def user2 = new User(username: 'Erwin',password: '123'.encodeAsPassword(),email: 'Erwin@gmail.com',active: 1)
        user1.save()
        user2.save()
        def posts = [new Post(title: 'Read Me First',content: '<p>CoolBlue is a free website template by <a href="http://www.styleshout.com/">styleshout.com</a>.\n' +
                '                        This work is\n' +
                '                        released and licensed under the <a rel="license"\n' +
                '                                                           href="http://creativecommons.org/licenses/by/3.0/">\n' +
                '                            Creative Commons Attribution 3.0 License</a>, which means that you are free to\n' +
                '                        use and modify it for any personal or commercial purpose. All I ask is that you give me credit\n' +
                '                        by including a link back to\n' +
                '                            <a href="http://www.styleshout.com/">my website</a>.\n' +
                '                        </p>\n' +
                '\n' +
                '                        <p>\n' +
                '                            You can find more of my free template designs at <a href="http://www.styleshout.com/">my\n' +
                '                        website</a>.\n' +
                '                        For premium commercial designs, you can check out <a href="http://themeforest.net?ref=ealigam"\n' +
                '                                                                             title="Site Templates">Themeforest</a>.\n' +
                '                        </p>'),
                new Post(title: 'Lorem Tellus Eleifend Magna',content: '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.\n' +
                        '\t\t\t\t\tCras id urna. Morbi tincidunt, orci ac <a href="index.html">convallis aliquam</a>, lectus turpis varius lorem, eu\n' +
                        '\t\t\t\t    posuere nunc justo tempus leo.</p>\n' +
                        '\n' +
                        '\t\t\t\t    <p>\n' +
                        '\t\t\t\t    Donec mattis, purus nec placerat bibendum, <a href="index.html">dui pede condimentum</a>\n' +
                        '\t\t\t\t    odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra\n' +
                        '\t\t\t\t    condimentum, lorem tellus eleifend magna, <a href="index.html">eget fringilla velit</a> magna id neque. Curabitur vel urna.\n' +
                        '\t\t\t\t    In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.\n' +
                        '\t\t\t\t    Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu\n' +
                        '\t\t\t\t    posuere nunc justo tempus leo.</p>')]
        posts*.publisher = user1
        posts*.save()
        print "$posts.size posts saved."

        def nav = [
                new Navigation(name:'Home',url:'#'),
                new Navigation(name:'Demo',url:'#'),
                new Navigation(name:'Archives',url:'#'),
                new Navigation(name:'Blog',url:'#'),
                new Navigation(name:'About',url:'#')
        ]

        nav*.save()
        print "$nav.size navigations saved."

        def tags = [
                new Tag(name:'Java',url:'#'),
                new Tag(name:'Grails',url:'#'),
                new Tag(name:'Git',url:'#'),
                new Tag(name:'Spring',url:'#'),
                new Tag(name:'Hibernate',url:'#')
        ]

        tags*.save()
        print "$tags.size tags saved."

        def replies = [
                new Reply(content:'hello'),
                new Reply(content:'hello hello'),
                new Reply(content:'hello hello hello')
        ]
        replies[0].post = posts[0]
        replies[0].replier = user1


        replies[1].post = posts[0]
        replies[1].replier = user1

        replies[2].replier = user2
        replies[2].replyTo = user1
        replies[2].parent = replies[0]

        replies*.save()
        print "$replies.size replies saved."
    }
    def destroy = {
    }
}
