---
layout: ../../components/MarkdownPost.astro
title: "汆论"
tags: ["math"]
pubDate: 'Feb. 8 2026'
likes: '(+inf)k'
comments: '+inf'
---

> 写于我的高二

# 0-预
我们知道，三角形是平面上的基本图形，角和边作为构成三角形基本原素。在空间中，四面体是基本图形，而我创造的正是四面体的“角”——汆角。

**汆角**：空间中共起点而不共面的三个射线。

接下来我会围绕汆角给出相关定义，属性，计算。
# 1-基本概念
1. 汆：空间中共起点而不共面的三个射线（一般，我们称**汆**即可）

> 注意
> 1. 三条射线的公共起点记为点`O`
> 2. 三条射线记为`la, lb , lc`
2. 棱：三条射线中任意一个
3. 角：任意两棱之间形成的角
4. 面：三条射线两两组成的三个平面：`αβγ`（`α`与`la`相对，即`α`由`lb, lc`组成）
5. 单位棱：棱长归一化的线段（线段端点为`O-A, B, C`）
6. 顶点：三条棱的交点，即点`O`
7. 单位点：点`A, B, C`
8. 汆的表示：汆O-ABC
>  注意
> 使用大写字母`ABC`即意味着他们是单位点，`O-A, B, C`长均为`1`
9. 单位向量：$\overrightarrow{OA} , \overrightarrow{OB} , \overrightarrow{OC}$简写为$\vec{A}, \vec{B}, \vec{C}$
10. 底面：`面ABC`
11. 底面三角：`三角形ABC`
12. 单位球：球心位于`O`的单位球
13. 底面圆：`底面`和`单位球`的交面，即`底面三角`的外接圆
14. 单位四面体：`四面体O-ABC`
15. 单位平行六面体：三个单位向量确定的平行六面体
16. （棱的）对应面：对于棱`O-A`的对应面是面`α`
17. （棱的）对面角：对于棱 $OA$ 的对面角 $\angle BOC$ 记为$\alpha$
18. 单位棱高：`单位棱`顶点`A, B, C`到对应面的距离，记为$H_a$或$H_{A}$
19. 棱-面角：`棱`与`对应面`的夹角，记为$α_{\perp}$
20. 面-面角：两`面`的夹角，记作$\land A$
21. 衡棱线：是一条经顶点出发的`射线`（方向取向：与底面有交点），此线上任何点到三条`棱`的距离相等
22. 衡面线：是一条经顶点出发的`射线`（方向取向：与底面有交点），此线上任何点到三个`面`的距离相等
23. 贯线：`顶点`到`底面三角`的重心的射线
24. 单位球三角：在`单位球`上的`球面三角形ABC`
25. 特殊汆：半等汆，等汆，正汆，半正汆，小正汆，直面汆，直面汆
26. 对应锥：圆锥（`顶点` - `底面圆`）
27. 锥角：对应锥的顶角$\dot{\Delta}$
28. 锥高：锥高，即`顶点`到`底面`的距离
29. 底面半径：`底面圆`的半径
# 2-关于引言及衡棱线
三角形（二维单纯形）作为平面上的基本图形
1. 三角形是平面几何中的基本元素
2. 三个点是确定一个平面的最少信息，同时两邻边对应的向量又可以看作此面的基底
3. 任意多边形都可以拆成三角形
4. 三角形中蕴含着大量的定理和性质

到了空间中，我们的四面体（三维单纯形）（三棱锥）则是最基本元素。

可是从命名上看，它并没有沿用角（比如四角体），而是用了面或棱。难道就不配在空间中拥有角吗？于是我创造了`汆`的概念，故四面体等于四汆体。

起名为汆的原因（我瞎起的）：`入`的结构正好像`空间中共起点而不共面的三个射线`的结构，十分形象！

我首先研究的是它的`角分线`

我们知道，在平面几何中，角分线上的点到角两边的距离相等。所以汆的角分线也到三个棱的距离相等，我称为衡棱线。接着我开始想衡棱线在哪以及怎么计算

设 $\vec{O}$ 为原点，$\vec{A}, \vec{B}, \vec{C}$是汆的单位向量。若$\vec{P}$在衡棱线上，则:
$$|\vec{P} \cdot \vec{A}| = |\vec{P} \cdot \vec{B}| = |\vec{P} \cdot \vec{C}|$$

我首先尝试了$\vec{P} = \lambda (\vec{A}+\vec{B}+\vec{C})$，因为平面上角分线可以这样算，但我发现它并不满足上式。它其实是这个它对应平行六面体的对角线。

接着我想，既然$|OA| = |OB| = |OC|$，我让它们成为以顶点 $O$ 为顶点的一个圆锥的三个母线，而 $A$、 $B$、 $C$ 必然确定一个面，三点圆作为圆锥的底，那么圆锥高线与任何母线夹角恒定，其中包括 $OA$、 $OB$、 $OC$。

如此一来，便找到了衡棱线 $OH$。如何用向量表示呢？一开始我还苦于找到 $\Delta ABC$ 外心 $H$， $OH$即衡棱线。

但是转念一想，我只找方向即可，不及大小。于是我可以写出与 $OH$ 同方向的向量：
$$\vec{P} = \lambda ((\vec{C}-\vec{A}) \times (\vec{B}-\vec{A}))$$
注：用到的叉积运算性质
1. $\vec{a} \times \vec{a} = \vec{O}$
2. $\vec{a} \times \vec{b} + \vec{c} \times \vec{d} = (\vec{a} - \vec{c}) \times (\vec{b} - \vec{d}) + \vec{a} \times \vec{d} + \vec{c} \times \vec{b}$
3. $\vec{a} \cdot (\vec{b} \times \vec{c}) = \vec{b} \cdot (\vec{c} \times \vec{a}) = \vec{c} \cdot (\vec{a} \times \vec{b})$

验证：

$$
\begin{align}
\vec{P} &= \lambda \left( \left(\vec{C}-\vec{A}) \times (\vec{B}-\vec{A} \right) \right) \\
&= \lambda \left(\vec{C} \times \vec{B} - \vec{C} \times \vec{A} - \vec{A} \times \vec{B} + \vec{A} \times \vec{A} \right) \\
&= \lambda \left( \vec{C} \times \vec{B} + \vec{A} \times \vec{C} + \vec{B} \times \vec{A} \right) \\
\end{align}
$$
计算$\left| \vec{P} \cdot \vec{A} \right|$：

$$
\begin{aligned}
\left| \vec{P} \cdot \vec{A} \right| &= \left| \lambda \left( \vec{C} \times \vec{B} + \vec{A} \times \vec{C} + \vec{B} \times \vec{A} \right) \cdot \vec{A} \right| \\
&= \left| \lambda \left( \left(\vec{C} \times \vec{B} \right) \cdot \vec{A} + \underbrace{ \left(\vec{A} \times \vec{C}\right) \cdot \vec{A}}_{0} + \underbrace{\left(\vec{B} \times \vec{A} \right) \cdot \vec{A}}_{0} \right) \right| \\
&= \left| \lambda \left(\left(\vec{C} \times \vec{B} \right) \cdot \vec{A} \right) \right|
\end{aligned}
$$

同理：

$$
\begin{align}

&\left| \vec{P} \cdot \vec{B} \right| = \left| \lambda \left( - \left(\vec{C} \times \vec{A} \right) \cdot \vec{B} \right) \right|\\

&\left| \vec{P} \cdot \vec{C} \right| = \left| \lambda \left( - \left(\vec{A} \times \vec{B} \right) \cdot \vec{C} \right) \right|\\

\end{align}
$$
可以看出：
$$
\left| \vec{P} \cdot \vec{A} \right|
= \left| \vec{P} \cdot \vec{B} \right|
= \left| \vec{P} \cdot \vec{C} \right|
$$

衡棱线的性质：
1. 线上的点到三个棱距离相等
2. 线上与三棱夹角相等
3. 线穿过底面三角的外心，穿过底面圆的圆心，与底面法向量共线
4. 线上的点到单位点 A、 B、 C 的距离相等
# 3-贯线
想象一下，你有三根等长的木棍（不妨设为$2$单位长），粘住他们的一个顶点不动，在空间中形成汆，接着用绳子吊起顶点，绳子所在直线是什么？没错——贯线

使用每一根木棍重心$A, B, C$（木棍均匀，中点为重心）代替木棍。然后用$\Delta ABC$的重心 $G$ 代替三个质点$A, B, C$。如此一来，就相当于绳直接吊着一个球$G$。

那`顶点`与`底面三角`重心$G$连线的直线，就是绳所在的直线，我称之为`贯线`，有贯穿之意。

贯线如何计算？首先表示出底面三角的重心
$$
\vec{G} = \frac{1}{3} \left(\vec{A}+\vec{B}+\vec{C} \right)
$$

那么贯线的方程就是
$$\vec{P} = \lambda (\vec{A}+\vec{B}+\vec{C})$$

这正是左边我刚开始尝试的衡棱线。

贯线的性质：
1. 穿过`底面三角`重心，并且穿过所有`平行于底面的平面`$\alpha$与三棱交点构成的三角形重心。穿点（贯线与$\alpha$的交点）连向三点的向量和为 $\vec{0}$。
2. 棱，贯线，其余两棱角分线，三线共面。
3. 如上引入的物理性质
# 4-特殊汆体
棱 $OA$ 的`对面角`（定义17） $\angle BOC$ 记为$\alpha$
棱 $OB$ 的`对面角` $\angle AOC$ 记为$\beta$
棱 $OC$ 的`对面角` $\angle AOB$ 记为$\gamma$

$\alpha, \beta, \gamma$称为此汆的`角`（定义3）。

- 等汆和半等汆
  有两个`角`相等叫做`半等汆`
  在`半等汆`的基础上，另一`角`与`两角`也相等叫做`等汆`

- 直汆和半直汆
  在`半等汆`的基础上，两个`角`为直角，叫为`半直汆`
  如果三个`角`均为直角叫做`直汆`

- 无欺
  同时，有且仅有两个`角`相等，且不是直角，叫`无欺半等汆`
  三个`角`均相等且不是直角，叫`无欺等汆`
  两个`角`为直角，且一个`角`非直角，叫做`无欺半直汆`

- 直面汆
  当有两个面垂直时，此汆叫做直面汆

>  嘿嘿
> 无欺灵感来自：子集/真子集
# 5-四面体及平行六面体，单位棱高、棱面角
汆的`单位四面体`（定义14）指单位长度下四面体，即锥 O-ABC，平面六面体同理
$$
\begin{align}

&V_{单位四面体} =
\frac{1}{6} \left|\vec{A} \cdot \left(\vec{B} \times \vec{C} \right) \right|\\

&V_{单位平行六面体} =
\left|\vec{A} \cdot \left(\vec{B} \times \vec{C} \right) \right|\\

&S_{单位平行六面体} =
2\left(
\left| \vec{B} \times \vec{C} \right|+
\left| \vec{A} \times \vec{C} \right|+
\left| \vec{A} \times \vec{B} \right|
\right)\\

\end{align}
$$

单位棱高、棱面角公式
$$
\begin{align}

H_{A}^2 &= \sin^2 α_{\perp}\\

&= \frac{\sin^2\alpha-\cos^2\beta-\cos^2\gamma+2\cos\alpha \cdot \cos\beta \cdot \cos\gamma}
{\sin^2\alpha}\\

&= \frac{S^2_{\alpha}-C^2_{\beta}-C^2_{\gamma}+2C_{\alpha}C_{\beta}C_{\gamma}}
{S^2_{\alpha}}

\end{align}

$$

推导证明：
建系如图

>  建系图描述
> 顶点位于原点，射线OC与x轴重合，面COB与xy平面贴合，A点位于xy平面上方空间

我们知道$|\vec{A}| = |\vec{B}| = |\vec{C}| = 1$

$$
\begin{cases}
\vec{A} \cdot \vec{C} = \cos\beta \\
\vec{A} \cdot \vec{B} = \cos\gamma \\
\end{cases}
\implies
\begin{cases}
X = \cos\beta\\
Y = \frac{\cos\gamma-\cos\alpha \cdot \cos\beta}
{\sin\alpha}
\end{cases}
$$
进而
$$
\begin{align}
Z^2 &= 1 - X^2 - Y^2\\

&= \frac{\sin^2\alpha-\cos^2\beta-\cos^2\gamma+2\cos\alpha \cdot \cos\beta \cdot \cos\gamma}
{\sin^2\alpha}\\

&= \frac{S^2_{\alpha}-C^2_{\beta}-C^2_{\gamma}+2C_{\alpha}C_{\beta}C_{\gamma}}
{S^2_{\alpha}}\\

&= [单位棱高平方]H_{A}^2\\
&= [棱面角正弦平方] S_{\alpha_{\perp}}^2

\end{align}

$$


对于汆的`底面三角`它的外接圆圆心落在汆的`衡棱线`上

>  提醒
> 1. 对于一般的汆的`底面三角`，`衡面线`**不会穿过**内切圆圆心，而是指向`球面三角形的内心`
> 2. 而对于非单位点构成的四面体，若 OA'、 OB'、 OC' 相等，则上述结论仍然成立。而若三个长度不全相等，则外接圆圆心`不`落在`衡棱线`上

# 6-直面汆定理
当有两个面垂直时，此汆叫做`直面汆`。

如图

>  图描述
> OB延长至B'，OA延长至A'，我们使用`'`把单位点区分
> 面B'OC垂直于面A'OC，且B'C垂直于A'C（C-OA'B'为`直汆`）

有
$$
\begin{align*}
|OC| &= 1 & |CA'| &= \tan\beta \\
|OA'| &= \frac{1}{\cos\beta} & |CB'| &= \tan\alpha \\
|OB'| &= \frac{1}{\cos\alpha}
\end{align*}
$$
$面 OBC \perp 面 OAC$， $A、 B、 C$ 均为`单位点`， $A'、 B'$为`非`单位点， $B'C \perp A'C$， 可以说：$汆 -C O B' A$ 为`直汆`
$$
\begin{align}

&|A'B'|^2 =
|B'C|^2+|A'C|^2
= T_{\alpha}^2 + T_{\beta}^2\\

&|A'B'|^2 =
|OB'|^2+|OA'|^2 - 2 |OB'| |OA'| \cos\gamma

\end{align}

$$
即
$$
T_{\alpha}^2+T_{\beta}^2 =
\frac{1}{C_{\alpha}^2} + \frac{1}{C_{\beta}^2}
- 2 \frac{C_{\gamma}}{C_{\alpha} C_{\beta}}
  $$
  同乘$C_{\alpha}^2 C_{\beta}^2$ ，变为
  $$
  S_{\alpha}^2 C_{\beta}^2 + S_{\beta}^2 C_{\alpha}^2
  = C_{\beta}^2 + C_{\alpha}^2 - 2C_{\alpha}C_{\beta}C_{\gamma}
  $$
  移项并应用 $S^2+C^2=1$，整理得
  $$
  C_{\alpha}C_{\beta} = C_{\gamma}
  $$
  称之为直面汆定理。注意使用条件是汆中有直二面角，即直面汆。

>  事实上
> 这正是**球面几何中的勾股定理**

这其实是高中常见扩展结论，据我观察，身边老师和同学大部分到了解它，却止步于这个在汆论中的特例公式。

我的研究就是为了让我们认清一般化的汆的计算。

# 7-面面角
建系方案同-7直面汆定理

另外，我们设：$A \xrightarrow{向xy平面投影} A_{0}$

让我们来计算：$二面角 A-OC-B$，

法向量求法或许更复杂，故采用找二面角的平面角$\angle AC'A_{0}$解决
$$
\begin{align}
&|AC'| = S_{\beta}\\
&|AA_{0}| = H_{A}\\
&|A_{0}C'| = Y\\
\end{align}
$$
此二面角记作：$\land C$，有
$$
\begin{align}

&tan^2(\land C) = \frac{H_{A}^2}{Y^2}
= \frac{1-(
C_{\alpha}^2 + C_{\beta}^2 + C_{\gamma}^2
)+2C_{\alpha}C_{\beta}C_{\gamma}}
{(C_{\gamma}-C_{\alpha}C_{\beta})^2}\\

&\sin^2(\land C) = \frac{H_{A}^2}{S_{\beta}^2}
= \frac{1-(
C_{\alpha}^2 + C_{\beta}^2 + C_{\gamma}^2
)+2C_{\alpha}C_{\beta}C_{\gamma}}
{S_{\alpha}^2 S_{\beta}^2}\\

&\cos(\land C) = \frac{Y}{S_{\beta}}
= \frac{C_{\gamma}-C_{\alpha} C_{\beta}}
{S_{\alpha} S_{\beta}}
\end{align}
$$

# 8-底面三角

约定：
1. $C_{\theta} = \cos \theta$
2. $BC^{2}$ 记作 $a^{2}$ ， 边$a,b,c$ 对应角 $\alpha,\beta,\gamma$

边长：$BC^{2}=2 - 2\cos\alpha$
角： $c^{2}=a^{2}+b^{2}-2ab\cos C$
面积：
$$
S = \frac{1}{2}\sqrt{
3
-2(C_{\alpha}+C_{\beta}+C_{\gamma})
+2(C_{\alpha}C_{\beta}
+C_{\alpha}C_{\gamma}
+C_{\beta}C_{\gamma})
-(C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2)
}
$$


面积推导过程：
利用面积公式 $S=\frac{1}{4}\sqrt{(a + b + c)(b + c - a)(a + c - b)(a + b - c)}$
根号下部分：
$(a + b + c)(b + c - a)=(-a^{2}+b^{2}+c^{2}+2bc)$   $(a + c - b)(a + b - c)=(a^{2}-b^{2}-c^{2}+2bc)$

则
$$
\begin{align}
&(a + b + c)(b + c - a)(a + c - b)(a + b - c)\\

&=(2bc + a^{2}-b^{2}-c^{2})(2bc-(a^{2}-b^{2}-c^{2}))\\

&=(2bc)^{2}-(a^{2}-b^{2}-c^{2})^{2}\\

&=2(a^{2}b^{2}+a^{2}c^{2}+b^{2}c^{2})-(a^{4}+b^{4}+c^{4})\\

&=2T_{1}-T_{2}
\end{align}
$$
其中：（用 $\alpha$ 代替 $\cos\alpha$ 书写）

$$
\begin{align}
T_{1} &= a^{2}b^{2}+a^{2}c^{2}+b^{2}c^{2}\\

&=4(1 - \alpha-\beta+\alpha\beta + 1-\alpha-\gamma+\alpha\gamma+1 - \beta-\gamma+\beta\gamma)

\end{align}
$$
即
$$
2T_{1}=24-16(\alpha+\beta+\gamma)+8(\alpha\beta+\alpha\gamma+\beta\gamma)
$$
以及
$$
\begin{align}
T_{2} &= a^{4}+b^{4}+c^{4}\\
&=12
+4(\alpha^{2}+\beta^{2}+\gamma^{2})
-8(\alpha+\beta+\gamma)

\end{align}
$$

所以
$$
\begin{align}
S&=\frac{1}{4}\sqrt{2T_{1}-T_{2}}\\

&=\frac{1}{4}\sqrt{4(
3
-2(\alpha+\beta+\gamma)
+2(\alpha\beta+\alpha\gamma+\beta\gamma)
-(\alpha^{2}+\beta^{2}+\gamma^{2})
)}\\

&= 上式

\end{align}
$$

经GeoGebra验证

# 9-对应锥、锥角和锥高
我们刚刚讨论衡棱线时，使用了单位圆锥（指顶点与底面圆构成的圆锥）。汆的衡棱线与对应锥的高线重合

而当我没有计算这个高是多少，锥顶角是多少，而有了底面三角公式，便可以计算了

设汆的四面体体积为 $V$， 则
$$
V = \frac{1}{3} H_{A} \cdot S_{\Delta OBC}
$$
设对应锥的高为 $h$，那
$$
V = \frac{1}{3} h \cdot S_{\Delta OBC}
$$

由于之前得到的$H_{A}$是带平方的，同时$S_{\Delta OBC}$是带根号的, 为了成全它们都带平方，得到:
$$
H_{A}^2 S_{\Delta OBC}^2 = h^2 S_{\Delta ABC}^2
\quad \quad
S_{OBC}{}^2 = \frac{1}{4}S_{\alpha}^2
$$

刚好与  $H_{A}^2$ 分母约去  $S_{\alpha}^2$ ，得
$$
\begin{align}
&\frac{1}{4}
\left(1-\left(C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2\right)
+2 C_{\alpha}C_{\beta}C_{\gamma}\right) \\

&=\frac{1}{4} h^2 \left(
3
-2\left(C_{\alpha} + C_{\beta} + C_{\gamma}\right)
+2\left(
C_{\alpha}C_{\beta}
+C_{\alpha}C_{\gamma}
+C_{\beta}C_{\gamma}
\right)
-\left(C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2\right)
\right)
\end{align}
$$

所以
$$ h^2 = \frac
{1
-\left(C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2\right)
+2 C_{\alpha}C_{\beta}C_{\gamma}}

{3
-2\left(C_{\alpha} + C_{\beta} + C_{\gamma}\right)
+2\left(
C_{\alpha}C_{\beta}
+C_{\alpha}C_{\gamma}
+C_{\beta}C_{\gamma}
\right)
-\left(C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2\right)
}
$$

[经 GeoGebra 验证]

记圆锥的顶角为 $\dot{\Delta}$, 则$\cos^2 \frac{\dot{\Delta}}{2} = h^2$

为了方便书写与记忆, 引入关于基本量 $C_{\alpha}, C_{\beta}, C_{\gamma}$ 计算的记号:
$$
\begin{align*}
p &= C_{\alpha}^2+C_{\beta}^2+C_{\gamma}^2
& m &= C_{\alpha}C_{\beta}C_{\gamma} \\

    s &= C_{\alpha} + C_{\beta} + C_{\gamma}
    & x_{s} &= 
	    C_{\alpha}C_{\beta}
		+C_{\alpha}C_{\gamma}
		+C_{\beta}C_{\gamma} 
	\\

\end{align*}
$$

$h^2$ 可以简写为
$$
h^2 = \frac{1-p+2m}
{3-2s+2x_{s}-p}
$$

设底面圆半径为 $r$, 我们知道: $h^2+r^2=1$，所以
$$
r^2=1-h^2 = \frac{(2-2s+2x_{s}-2m)}
{(3-2s+2x_{s}-p)}
$$

接下来我们研究底面圆上角 $\angle AO'B$ (例) 如何计算

建系，设
$$
\begin{align}
&O=(0,0,h), \\
&O'=(0,0,0), \\
&A = (r C_{A}, r S_{A}, 0) \\
&B = (r C_{B}, r S_{B}, 0) \\
&C = (r C_{C}, r S_{C}, 0)
\end{align}
$$

>  注意
> 这里C_{A}指代A在底面圆的坐标系偏角
> 我们的坐标系正式建立在底面圆上的，这是易见的

则
$$
\begin{align}
\overrightarrow{OA} &= (r C_{A}, r S_{A}, -h)\\
\overrightarrow{OB} &= (r C_{B}, r S_{B}, -h)\\
\end{align}
$$
而
$$
\vec{OA} \cdot \vec{OB} = \cos \gamma \quad (bc:|\vec{OA}| = |\vec{OB}| = 1)
$$
即
$$
r^2 (C_{A}C_{B} + S_{A}S_{B}) + h^2
= \cos \gamma
$$
其中的$(C_{A}C_{B} + S_{A}S_{B})$正是 $\cos\angle AO'B$，得到
$$
\cos \gamma - 1 = r^2 (\cos\angle AO'B - 1)
$$

另附： $H_{A}, \land A$等计算的简写形式
$$
\begin{align}
&H_{A}^2 =
\sin^2 α_{\perp} = \frac{1-p+2m}{S_{\alpha}^2} \\

&\cos(\land C) =
\frac{C_{\gamma}-C_{\alpha}C_{\beta}}{S_{\alpha}S_{\beta}} \\

&\sin^2(\land C) = \frac{1-p+2m}{S_{\alpha}^2 S_{\beta}^2} \\

&tan^2(\land C) = \frac{1-p+2m}{(C_{\gamma}-C_{\alpha}C_{\beta})^2}\\

&S_{\Delta ABC} = \frac{1}{2} \sqrt{3 - 2s + 2x_{s} - p}

\end{align}
$$
# 10-子汆及衡面线
终于想出了`衡面线`的求法，可以借助“子汆”求解一个汆的衡面线。

## 定义

首先我来介绍一下子汆的定义：

已知一个汆 O-ABC，令
$$
\vec{A_1} = \frac{\vec{C} \times \vec{B}}{|\vec{C} \times \vec{B}|}

\quad

\vec{B_1} = \frac{\vec{A} \times \vec{C}}{|\vec{A} \times \vec{C}|}

\quad

\vec{C_1} = \frac{\vec{B} \times \vec{A}}{|\vec{B} \times \vec{A}|}
$$
则 O-A₁B₁C₁ 叫原汆的`子汆`。

>  注意
> 这里的叉积顺序是重要的，不可搞反。

生成子汆的过程称为`汆的分娩`，记子汆为$汆O-A_{1}B_{1}C_{1}$，原汆叫子汆的母汆，子汆的子汆为原汆的孙汆，记为：$汆O-A_{2}B_{2}C_{2}$。

## 推导
想象一下，左图虚线为余 O−ABC的衡面线

>  图描述
> 1. 我们作出汆的衡面线，使用虚线表示
> 2. 取点P位于虚线之上，P向{过O垂直面BOC的直线$OA_{1}$}的投影为$P_{A1}'$，向面BOC的投影为$P_{A}'$

根据定义，衡面线上的点 $P$ 到三个`面`的距离相等。

做 $PP_{A}'$ 是 $面OBC$的垂线，$P_{A}'$ 在面上。同时，计算 $\vec{C} \times \vec{B}$ 并转单位向量 $\overrightarrow{OA_{1}}$，将$\overrightarrow{P_{A}'P}$平移到$\overrightarrow{OA_{1}}$上得到$\overrightarrow{OP_{A1}'}$，易得

$$
OP_{A1}' \xlongequal{||} P_{A}'P
$$

因此可得矩形 $OPA'PA''$。

由 $PP_{A}' = PP_{B}' = PP_{C}'$ ，在 $\triangle OPP_{A}'$、$\triangle OPP_{B}'$、$\triangle OPP_{C}'$ 中得 $OP_{A}' = OP_{B}' = OP_{C}'$，于是 $PP_{A1}' = PP_{B1}' = PP_{C1}'$

而 $PA_{1}'$、$PB_{1}'$、$PC_{1}'$ 均为垂足，这便符合衡棱线的定义，虚线是汆 $O-A_1B_1C_1$ 的衡棱线。

对此，我们有**衡面线定理**：一个汆的衡面线，与其子汆的衡棱线重合
[经GeoGebra验证]

---

基本量关系命名

>  注意
> 下标代表汆的“辈分”是约定的，下文的计算中会直接使用

| 命名  | 记法                   | 角                                   | 面面角                                     |
| --- | -------------------- | ----------------------------------- | --------------------------------------- |
| 原汆  | $汆O-ABC$             | $\alpha, \beta, \gamma$             | $\land A, \land B, \land C$             |
| 子汆  | $汆O-A_{1}B_{1}C_{1}$ | $\alpha_{1}, \beta_{1}, \gamma_{1}$ | $\land A_{1}, \land B_{1}, \land C_{1}$ |
| 孙汆  | $汆O-A_{2}B_{2}C_{2}$ | $\alpha_{2}, \beta_{2}, \gamma_{2}$ | $\land A_{2}, \land B_{2}, \land C_{2}$ |
## 下面来证明衡面线定理：

原汆：$O-ABC$

计算子汆三个方向：
$$
\vec{A_1} = \frac{\vec{C} \times \vec{B}}{|\vec{C} \times \vec{B}|}

\quad

\vec{B_1} = \frac{\vec{A} \times \vec{C}}{|\vec{A} \times \vec{C}|}

\quad

\vec{C_1} = \frac{\vec{B} \times \vec{A}}{|\vec{B} \times \vec{A}|}
$$

由衡棱线公式，计算子汆的衡棱线：
$$
\begin{align}

\vec{P} &= \lambda (\vec{A_1} - \vec{C_1}) \times (\vec{A_1} - \vec{B_1})\\

&= \lambda
\left(
\frac{\vec{C} \times \vec{B}}
{|\vec{C} \times \vec{B}|}
- \frac{\vec{B} \times \vec{A}}
  {|\vec{B} \times \vec{A}|}
  \right)
  \times
  \left (
  \frac{\vec{C} \times \vec{B}}
  {|\vec{C} \times \vec{B}|}

- \frac{\vec{A} \times \vec{C}}
  {|\vec{A} \times \vec{C}|}
  \right) \\

\end{align}
$$
为了方便，我们记
$$
\vec{a} = \vec{C} \times \vec{B}
\quad \quad
\vec{b} = \vec{A} \times \vec{C}
\quad \quad
\vec{c} = \vec{B} \times \vec{A}
$$
并记（为了方便书写而暂时规定）
$$
\underline{\vec{v}} = \frac{\vec{v}}{|\vec{v}|}
$$
则
$$
\vec{P} = \lambda (
\underline{\vec{c}} \times \underline{\vec{b}}
-\underline{\vec{a}} \times \underline{\vec{b}}
-\underline{\vec{c}} \times \underline{\vec{a}}
)
$$
我们来验证$\vec{P}$是否在原汆-$汆 O-ABC$的衡棱线上。
根据定义，若$\vec{P}$满足
$$
\frac{\vec{P}\cdot\vec{a}}{|\vec{a}|}=
\frac{\vec{P}\cdot\vec{b}}{|\vec{b}|}=
\frac{\vec{P}\cdot\vec{c}}{|\vec{c}|}
$$
则$\vec{P}$在衡面线上。
在此，我们验证$\frac{\vec{P}\cdot\vec{a}}{|\vec{a}|}=\frac{\vec{P}\cdot\vec{b}}{|\vec{b}|}$ ，另外的同理


我们来验证 $\vec{p}$ 是否在原余 $O-ABC$ 的衡面线上。根据定义，若 $\vec{p}$ 满足：
$$
\frac{\vec{p} \cdot \vec{a}}{|\vec{a}|} = \frac{\vec{p} \cdot \vec{c}}{|\vec{c}|} = \frac{\vec{p} \cdot \vec{b}}{|\vec{b}|}
$$
（这里的 $\vec{a}, \vec{b}, \vec{c}$ 是上述法向量）则证明 $\vec{p}$ 在衡面线上。在此仅验证 $\frac{\vec{p} \cdot \vec{a}}{|\vec{a}|} = \frac{\vec{p} \cdot \vec{c}}{|\vec{c}|}$，剩余同理可证。

计算 $\vec{p} \cdot \frac{\vec{a}}{|\vec{a}|}$：
$$
\begin{align}

\vec{p} \cdot \frac{\vec{a}}{|\vec{a}|} &=

\lambda \, \left[

(\vec{c} \times \vec{b}) \cdot \vec{a}

- (\vec{a} \times \vec{b}) \cdot \vec{a}

- (\vec{c} \times \vec{a}) \cdot \vec{a}

\right]\\

&= \lambda \, (\vec{c} \times \vec{b}) \cdot \vec{a}

\end{align}
$$

计算 $\vec{p} \cdot \frac{\vec{c}}{|\vec{c}|}$：
$$
\begin{align}
\vec{p} \cdot \frac{\vec{c}}{|\vec{c}|} &=
\lambda \, \left[
(\vec{c} \times \vec{b}) \cdot \vec{c}
- (\vec{a} \times \vec{b}) \cdot \vec{c}
- (\vec{c} \times \vec{a}) \cdot \vec{c}
  \right]\\

&= -\lambda \, (\vec{a} \times \vec{b}) \cdot \vec{c} \\

&= \lambda \, (\vec{c} \times \vec{b}) \cdot \vec{a}
\end{align}
$$

证明完毕！

---

## 下面介绍原余，子余，孙余间一些量的关系：

由子汆的定义，我们不难联想到子汆与原汆在角上具有的关系

具体是，由于子汆的棱垂直于原汆的面，故棱的夹角与原汆的面面角一致。

而向量这里我们不得不考虑方向，故实际上子汆单位向量的夹角与原汆面面角互补。

即
$$
\begin{align}
\gamma_{1} + \land C &= \pi
&\alpha_{1} + \land A &= \pi
&\beta_{1} + \land B &= \pi \\

    \gamma_{2} + \land C_{1} &= \pi
    &\alpha_{2} + \land A_{1} &= \pi 
    &\beta_{2} + \land B_{1} &= \pi \\
\end{align}
$$
根据面面角公式
$$
\begin{align}

\cos \land C_{1} &=
\frac{
\cos \gamma_{1} - \cos \alpha_{1} \cos \beta_{1}
}{
\sin \alpha_{1} \sin \beta_{1}
}\\
&=\frac{
\cos (\pi-\land C) - \cos (\pi-\land A) \cos (\pi-\land B)
}{
\sin (\pi-\land A) \sin (\pi-\land B)
}\\
&=\frac{
-\cos (\land C) - \cos (\land A) \cos (\land B)
}{
\sin (\land A) \sin (\land B)
}\\
\end{align}
$$
又因为$\gamma_{2}=\pi-\land C_{1}$，所以
$$
\begin{align}
\cos \gamma_{2}&=-\cos \land C_{1}\\
&=\frac{
-\cos (\land C) - \cos (\land A) \cos (\land B)
}{
\sin (\land A) \sin (\land B)
}\\
\end{align}
$$
所以，我们便可以在原，子，孙汆的基本量之间畅行无阻

| \     | 原         | 子             | 孙             |
| ----- | --------- | ------------- | ------------- |
| **棱** | $\alpha$  | $\alpha_{1}$  | $\alpha_{2}$  |
| **面** | $\land A$ | $\land A_{1}$ | $\land A_{2}$ |

## 衡面线有什么作用呢
1. 横面线上的点到三个面的距离相等
2. 横面线与三个面的夹角相等
3. 横面线是此汆的切球系球心所在直线
4. 在计算四面体内切球球心时，可以计算其中两汆的衡面线，其交点便为所求

# 11-汆的度量初步讨论
像度量平面中的角一样，汆也拥有一套法则来度量不同汆的大小、尖锐程度。

平面中的角采用弧度制，在单位圆上的弧量取与半径相同的一段，对应角定义为 1 弧度。

相对于用`弦`作图衡量，弧度制对于角的划分更`均匀`，并且得到广泛使用和代数自然性。

这种选择问题到了空间中，同样是令人思考的。

以下是可行的度量方案

| 方案     | 均匀（?直观） | 计算成本 | 类比平面角 |
| ------ | ------- | ---- | ----- |
| 底面三角面积 | n       | s    | n     |
| 底面圆面积  | n       | s    | n     |
| 锥角     | y       | s    | ?     |
| 球面三角面积 | y       | m    | y     |
| 球冠面积   | y       | s    | y     |

这里列举了我目前想到的度量方式，当然也许有其他度量方式更适合，但我主观倾向于用球面三角来度量。

因为在学校条件不允许我利用计算机来验证它们各自的优劣势，我希望一种度量方案可以具备仿照平面角的几何与代数性质。

比如四汆体内汆和外汆、中汆为一半的球心汆、四汆体中的正弦定理等


