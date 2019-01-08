# RGCategoryAddProperty



#
### category 的属性

<br>
#### 一、属性 @property 知识回顾

**1、 当我们给某个类(比如: Person),添加一个属性时(@property (nonatomic ,assign) int age)时, 其实系统帮我们做了3件事情.**
1> 添加一个属性( `int _age;` ).
2> 添加get 和set的声明( ` -(int)age; 和 -(void)setAge:(int)age;`)
3> 添加get 和 set的实现
即:

![](/assets/Snip20190107_9.png)


**2、 其实分类里面也是由属性 @property 的**
1> 当我们给某个分类(比如: Person(test)),添加一个属性时(@property (nonatomic ,assign) int age)时, 系统只会帮我们做了1件事情--添加get 和 set方法的声明

即:

![](/assets/Snip20190107_13.png)

**3、分类编译后的真实数据结构,没有成员变量**
![](/assets/Snip20190106_7.png)
从编译后的分类数据结构,我们也可以发现,分类是可以添加属性,但是不能添加成员变量的.




<br>
#### 二、给category 添加属性和成员变量
1、 从 上面回顾Category 的知识,和category 编译后的结构我们可以看出, category 是不能直接添加成员变量的. 如果,必须给category 添加成员变量,我们必须采用迂回的方式, 将变量存在其他地方, 保证每个实例对象有且只有一个对应的变量且只能通过category 内部的方法访问.


**方案一: 新增全局可变字典 **
在分类中添加一个全局的可变字典,使用实例对象的地址作为key 来访问.

![](/assets/Snip20190108_1.png)
**方案1缺点:**
1> 线程安全问题, 不同的线程可能在同一时间访问这个**全局的字典**, 不安全.
2> 每新增一个属性都要新增 字典麻烦



<br>
**方案二: runtime关联对象**
1、 默认情况下因为分类的数据结构, 不能给分类添加成员变量, 但是,我们可以通过关联对象来间接实现给分类添加成员变量的目的

关联对象提供了以下API
1> 添加关联对象
![](/assets/Snip20190108_5.png)
2> 获取关联对象
![](/assets/Snip20190108_6.png)
3> 移除关联对象
![](/assets/Snip20190108_7.png)

方式一:
![](/assets/Snip20190108_2.png)

方式二:
![](/assets/Snip20190108_3.png)

方式三:
![](/assets/Snip20190108_4.png)

方式四:
![](/assets/fs4.png)
**方式五: 推荐使用**

![](/assets/gltjfa.png)


<br>
#### 三、runtime 关联对象,底层实现

实现关联对象技术的核心对象有4个:
1> AssociationsManager
2> AssociationsHashmap
3> ObjectAssociationMap
4> ObjecAssociation
![](/assets/glyl.png)


也就是说,关联对象不是将数据存储在原来的类或者 分类里面, 而是根据对象自己维护了一张数据表.
