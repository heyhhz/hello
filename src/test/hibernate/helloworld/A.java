package hibernate.helloworld;

import java.util.List;
import java.util.Random;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class A {

	// 使用 Hibernate 的步骤
	// 第一步，建立 Web 工程
	// 第二步，将需要用到的 jar 包，拷贝到 lib 包的下面
	// 第三步，创建 hibernate 的配置文件 hibernate.cfg.xml，指定数据库信息、打印sql语句策略等
	// 第四步，创建实体类 Book.java
	// 第五步，创建数据库跟实体类的映射。有两种方式：XML方式、Annotation方式
	// 第 5(a) 步，创建相关的xml映射文件 Book.hbm.xml
	// 第 5(b) 步，在实体类上加相关的注解 @Entity/@Table/@Id/@GeneratedValue/@Column
	// 第六步，在 hibernate.cfg.xml 中添加映射，开始连接
	// 第 6.1 步，创建 sessionFactory
	// 第 6.2 步，创建 session
	// 第 6.3 步，创建 Transaction
	// 第 6.4 步，通过 Query 等进行查询；通过 save/delete 等进行增删。
	// 第 6.5 步，提交事务，关闭 session，关闭 SessionFactory。
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		// 初始化加载配置对象
		Configuration config = new Configuration();
		// 指定 Hibernate 配置文件
		config.configure("/hibernate/helloworld/hello.cfg.xml");
		// 初始化服务
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
		// 初始化 SessionFactory
		SessionFactory sessionFactory = config.buildSessionFactory(serviceRegistry);

		// 获取会话对象。通过这一步进行数据库连接。接下来就可以通过这个对象进行与数据库的交互。
		Session session = sessionFactory.openSession();
		// 开启事务。在 Hibernate 中，默认并不是 autocommit 的，所以需要显式控制事务。
		Transaction transaction = session.beginTransaction();

		// 插入数据到数据库
		try {
			session.save(new Book("aava", new Random().nextFloat()));
			session.save(new Book("aava", new Random().nextFloat()));

			transaction.commit();

			System.out.println(">>> 插入结束");

		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}

		// 从数据库中查询数据。这里用的是 Query 对象
		Query query = session.createQuery("from Book");
		List<Book> booklist = query.list();

		System.out.println(">>> 查询完成");

		System.out.println(booklist);

		System.out.println(">>> 一定不要忘记提交事务，释放资源");
		
		
		session.close();
		sessionFactory.close();
	}
	
}
