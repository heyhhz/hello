package s126.hello.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import s126.hello.bean.Item;


/**
 * Dao 是进行数据库连接的类
 */
public class ItemsDao extends BaseDao {

	// 初始化加载配置对象
	Configuration config = new Configuration().configure("hello.cfg.xml");
	// 初始化服务
	ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
	// 初始化 SessionFactory
	SessionFactory sessionFactory = config.buildSessionFactory(serviceRegistry);
	
	
	public List<Item> getByStatus(int status) {
		
		Session session = sessionFactory.openSession();
		
		/*String sql = "select id, name, price, ctime, status from items_info "
				+ "where status = ?";*/
		String hql = "from Item where status = ?";
		
		Query query = session.createQuery(hql);
		List<Item> list = query.setInteger(0, status).list();
		
		session.close();
		//return query(Item.class, sql, status);
		return list;
	}
	
}
