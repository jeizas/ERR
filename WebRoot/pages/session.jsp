<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Hibernate基本操作</title>
	<meta http-equiv="pragma" content="no-cache">

	<link rel="stylesheet" type="text/css" href="./css/style.css">
<style type="text/css"> 
pre{font-size:12;border:1px solid #000;width:750px;}
</style>
</head>
  
<body>
<p>以下是Hibernate操作数据数据库底层接口</p>
<pre>
	@Resource
	private SessionFactory sessionFactory;<span class="green">//从内存中取出sessionFactory</span>

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {<span class="green">//获得当前的session</span>
		return sessionFactory.getCurrentSession();
	}

	public Serializable save(T o) {<span class="green">//保存一个对象</span>
		return this.getCurrentSession().save(o);
	}

	public void delete(T o) {<span class="green">//删除一个对象</span>
		this.getCurrentSession().delete(o);
	}

	public void update(T o) {<span class="green">//更新一个对象</span>
		this.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {<span class="green">//保存或者更新</span>
		this.getCurrentSession().saveOrUpdate(o);
	}

	public List<T> find(String hql) {<span class="green">//通过回hql查询对象，不带带参数</span>
		return this.getCurrentSession().createQuery(hql).list();
	}

	public List<T> find(String hql, Object[] param) {<span class="green">通过hql查询对象，带参数</span>
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}
	<span class="green">//分页查询，获得对象，通过相同类型的参数</span>
	public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}
	<span class="green">//分页查询，获得对象，通过不同类型的参数</span>
	public List<T> find(String hql, List<Object> param, Integer page,
			Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}
	<span class="green">//通过id获得对象</span>
	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}
	<span class="green">//通过hql和参数获得对象</span>
	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}
	<span class="green">//同上</span>
	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}
	<span class="green">//通过对象获得总数</span>
	public Long count(String hql) {
		return (Long) this.getCurrentSession().createQuery(hql).uniqueResult();
	}
	<span class="green">//通过对象获得总数，hql带参数</span>
	public Long count(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}
	<span class="green">//同上</span>
	public Long count(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.uniqueResult();
	}
	<span class="green">//执行hql</span>
	public Integer executeHql(String hql) {
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}
	<span class="green">//同上</span>
	public Integer executeHql(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}
	<span class="green">//通过sql获得对象</span>
	public T getBySQL(String sql, Class<T> entity) {
		// TODO Auto-generated method stub
		List<T> l = this.findListBySQL(sql, entity);
		if( l != null && l.size()  > 0)
			return l.get(0);
		return null;
	}
	<span class="green">//通过sql获得list对象</span>
	public List<T> findListBySQL(String sql, Class<T> entity) {
		return this.getCurrentSession().createSQLQuery(sql).addEntity(entity).list();
	}
	<span class="green">//通过sql更新</span>
	@Override
	public Integer updateBySQL(String sql, Class<T> entity) {
		// TODO Auto-generated method stub
		return this.getCurrentSession().createSQLQuery(sql).addEntity(entity).executeUpdate();
	}
	<span class="green">//获得对象</span>
	public T getObjectBySQL(String sql) {
		// TODO Auto-generated method stub
		List<T> l=this.findObjectBySQL(sql);
		if(l != null && l.size()>0)
			return l.get(0);
		else
			return null;
	}
	<span class="green">//查找对象</span>
	public List<T> findObjectBySQL(String sql) {
		// TODO Auto-generated method stub
		return this.getCurrentSession().createSQLQuery(sql).list();
	}
	<span class="green">//通过sql更新</span>
	public int updateObjectBySQL(String sql) {
		// TODO Auto-generated method stub
		return this.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}
	<span class="green">//通过sql获得对象</span>
	@Override
	public List findBySQL(String sql) {
		// TODO Auto-generated method stub
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return query.list();
	}
</pre>
</body>
</html>
