import com.rolex.blog.Navigation
import com.rolex.blog.Post
import com.rolex.blog.Reply
import com.rolex.blog.Tag
import com.rolex.blog.User
import com.rolex.map.Project
import com.rolex.store.Image
import com.rolex.store.Product
import com.rolex.store.Product

class BootStrap {

    def init = { servletContext ->
        def user1 = new User(username: 'rolex',password: '123'.encodeAsPassword(),email: 'admin@gmail.com',active: 1)
        def user2 = new User(username: 'Erwin',password: '123'.encodeAsPassword(),email: 'Erwin@gmail.com',active: 1)
        user1.save()
        user2.save()

        def tags = [
                new Tag(name:'Java',url:'#'),
                new Tag(name:'Grails',url:'#'),
                new Tag(name:'Git',url:'#'),
                new Tag(name:'Spring',url:'#'),
                new Tag(name:'Hibernate',url:'#')
        ]

        tags*.save()
        print "$tags.size tags saved."

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
        posts*.author = user1
        posts*.tags = tags
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

        def replies = [
                new Reply(content:'hello'),
                new Reply(content:'hello<br><br><br><br><br> hello'),
                new Reply(content:'hello1'),
                new Reply(content:'hello2'),
                new Reply(content:'hello3')
        ]
        replies[0].post = posts[0]
        replies[0].replier = user1


        replies[1].post = posts[0]
        replies[1].replier = user1

        replies[2].replier = user2
        replies[2].replyTo = user1
        replies[2].parent = replies[0]

        replies[3].replier = user2
        replies[3].replyTo = user1
        replies[3].parent = replies[0]

        replies[4].replier = user2
        replies[4].replyTo = user1
        replies[4].parent = replies[0]

        replies*.save()
        print "$replies.size replies saved."



        def products = [
                new Product(title: 'iphone6',price: 5431,lastUpdated: new Date()),
                new Product(title: 'Samsung Galaxy Note3',price: 3699,lastUpdated: new Date()),
                new Product(title: 'HTC M8',price: 2599,lastUpdated: new Date()),
                new Product(title: 'HUAWEI Honor 6',price: 1999,lastUpdated: new Date()),
                new Product(title: 'Nokia Lumia930',price: 2899,lastUpdated: new Date()),
                new Product(title: 'Blackberry 9900',price: 1200,lastUpdated: new Date()),
                new Product(title: 'xiaomi4',price: 1799,lastUpdated: new Date())
        ]
        products*.save()
        print "$products.size products saved."

        def images = [
                new Image(name: 'rBEhVFIxaGkIAAAAAAGEV0SZGCMAADEsQOGrOkAAYRv640.jpg'),
                new Image(name: 'T1GZHjFUBaXXcXbVA1_040057.jpg_b.jpg'),
                new Image(name: 'T1mxq_FUFcXXbo7NIU_014802.jpg_b.jpg'),
                new Image(name: 'TB1FJaVFVXXXXbIXXXXVpKn.VXX_112018.jpg_b.jpg'),
                new Image(name: 'TB2x2kqaXXXXXbyXXXXXXXXXXXX_!!1711191736.jpg_430x430q90.jpg'),
                new Image(name: 'T2iZyFXrJXXXXXXXXX_!!274998653.jpg_b.jpg'),
                new Image(name: 'TB1rZZJFVXXXXaRXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg')
        ]
        images[0].product = products[0]
        images[1].product = products[1]
        images[2].product = products[2]
        images[3].product = products[3]
        images[4].product = products[4]
        images[5].product = products[5]
        images[6].product = products[6]

        images*.save()

        /**********************************************************/

        def projects = [
                new Project(name: '东关南里小区6号楼',x: 116.256772,y: 40.2224,address: '东关南里小区6号楼'),
                new Project(name: '蜀园饭庄(振兴路店)',x: 116.251567,y: 40.213901,address: '振兴路与富康路交叉口京科苑西区西')
        ]
        projects*.save()
    }
    def destroy = {
    }
}
