from matplotlib import cm
import matplotlib.pyplot as plt
import numpy as np
# fromulas
import sailing  as s

fig = plt.figure()
ax = plt.subplot(111,polar=True)
X = np.linspace(0, 3.14, 50)
Y = np.linspace(0, 6, 50)

s.values={s.Cz:5.5,s.Cx:1,s.CHx:.3,s.v_w:1.0}
s.force_simp=s.lambdify((s.gamma,s.v),(s.force1-s.force2).subs(s.values))
s.force=s.lambdify((s.gamma,s.v),(s.force1- s.force2 - s.CHx*s.v**2-0).subs(s.values))



Z=np.array([[s.force(g,h) for g in X] for h in Y])
X, Y = np.meshgrid(X, Y)
maximum=Z.max()

surf = ax.contourf(X, Y, Z, np.linspace(0, maximum, 20), rstride=1, cstride=1, cmap=cm.jet,linewidth=0, antialiased=False)

surf = ax.contourf(-X, Y, Z, np.linspace(0, maximum, 20), rstride=1, cstride=1, cmap=cm.jet,linewidth=0, antialiased=False)

fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()

