.. -*- coding: utf-8 -*-

Transpozycja macierzy
=====================

Podczas omawiania mnożenia macierzy, warto było zwrócić uwagę na fakt,
że w ogólności :math:`\alpha _{ij} \neq \alpha _{ji}`.  Operacja
zamiany wskaźników jest jednak na tyle ważna w rachunku macierzowym,
że ma swoją nazwę i jest określana mianem *transpozycji
macierzy*. Macierzą transponowaną do macierzy :math:`\boldsymbol{A}`
nazywamy macierz :math:`\boldsymbol{A_T}`:



| **Def.** Niech :math:`\boldsymbol{A} = (\alpha _{ij} ) \in M_{m \times n} (\boldsymbol{K})`.
|          Wtedy :math:`\boldsymbol{A} ^T = (\alpha _{ij} ^T ) \in M_{n \times m} (\boldsymbol{K})`, gdzie :math:`\alpha _{ij} ^T := \alpha _{ji}, \begin{array}{l} i = 1, 2, \ldots , n; \\ j = 1, 2, \ldots , m. \\ \end{array}`


**Przykłady.**

1) Jeżeli :math:`\boldsymbol{A} = \left( \begin{array}{cc} 
2 & - 1 \\ 3 & 0 \\ 
- 2 & 1 \\ 
\end{array} \right)
\in M_{3 \times 2} (\boldsymbol{R})`, to :math:`\boldsymbol{A} ^T = \left( \begin{array}{ccc} 
2 & 3 & -2 \\ 
-1 & 0 & 1 \\ 
\end{array} \right) \in M_{2 \times 3} (\boldsymbol{R})`.

2) Transpozycja macierzy kwadratowej:  :math:`\left( \begin{array}{ccc} 
-2 & 1 & 0 \\ 
5 & 2 & 3 \\ 
7 & -3 & 8 \\ 
\end{array} \right) ^T = \left( \begin{array}{ccc} 
-2 & 5 & 7 \\ 
1 & 2 & -3 \\ 
0 & 3 & 8 \\ 
\end{array} \right)`.

3) Transpozycja macierzy 1-kolumnowej:  :math:`\left( \begin{array}{c} 
\alpha _1 \\ 
\alpha _2 \\ 
\alpha _3 \\ 
\alpha _4 \\ 
\end{array} \right) ^T = \left( \begin{array}{cccc} 
\alpha _1 & \alpha _2 & \alpha _3 & \alpha _4 \\ 
\end{array} \right)`.


**Własności operacji transponowania macierzy.**

| 1.)  Niech :math:`\boldsymbol{A}, \boldsymbol{B} \in M_{m \times n} (\boldsymbol{K}), \quad \lambda \in \boldsymbol{K}`.
|  Wtedy :math:`(\boldsymbol{A} + \boldsymbol{B}) ^T = \boldsymbol{A} ^T + \boldsymbol{B} ^T , \quad (\lambda \boldsymbol{A}) ^T = \lambda \boldsymbol{A} ^T` (transpozycja jest operacją liniową).

| 2.)  Niech :math:`\boldsymbol{A} \in M_{m \times p} (\boldsymbol{K}), \quad \boldsymbol{B} \in M_{p \times n} (\boldsymbol{K})`.
|  Wtedy :math:`(\boldsymbol{A} \boldsymbol{B}) ^T = \boldsymbol{B} ^T \boldsymbol{A} ^T`.


   **Dowód.**

I. Porównanie  wymiarów.

.. math::
   \begin{array}{cc}
   \boldsymbol{A} \boldsymbol{B} \in M_{m \times n} (\boldsymbol{K}), & \boldsymbol{B} ^T \in M_{n \times p} (\boldsymbol{K}), \quad \boldsymbol{A} ^T \in M_{p \times m} (\boldsymbol{K}), \\ 
   (\boldsymbol{A} \boldsymbol{B}) ^T \in M_{n \times m} (\boldsymbol{K}). & \boldsymbol{B} ^T \boldsymbol{A} ^T \in M_{n \times m} (\boldsymbol{K}). \\ 
   \end{array}


II. Porównanie odpowiednich elementów.

    Niech :math:`\boldsymbol{A} = (\alpha _{ij})_{m \times p}, \quad \boldsymbol{B} = (\beta _{ij})_{p \times n}`.

    Wtedy :math:`(\boldsymbol{A} \boldsymbol{B}) ^T |_{ij} = (\boldsymbol{A} \boldsymbol{B})|_{ji} = \sum\limits_{s=1}^p {\alpha _{js} \beta _{si} }, \\  \boldsymbol{B} ^T \boldsymbol{A} ^T |_{ij} = \sum\limits_{s=1}^p {\beta _{is}^T \alpha _{sj}^T } = \sum\limits_{s=1}^p {\alpha _{js} \beta _{si} }, \quad 
    \begin{array}{l} i = 1, 2, \ldots , n; \\ j = 1, 2, \ldots , m. \\ 
    \end{array}`


Macierze symetryczne i antysymetryczne
--------------------

| **Def.** Jeżeli dla pewnej macierzy zachodzi: :math:`\boldsymbol{A} = \boldsymbol{A^T}` 
|          to taką macierz nazywamy macierzą symetryczną.

Macierz symetryczna posiada symetrię niezmienniczości względem odbicia
jej elementów względem głównej przekątnej.


| **Def.** Jeżeli dla pewnej macierzy zachodzi: :math:`\boldsymbol{A} = -\boldsymbol{A^T}` 
|          to taką macierz nazywamy macierzą antysymetryczną.


﻿

Rozkład na sumę macierzy symetrycznej i antysymetrycznej
--------------------------------------------------------

Każdą macierz można przedstawić w postaci sumy macierzy symetrycznej i
antysymetrycznej.  Jednoznaczny rozkład dowolnej macierzy na sumę
macierzy symetrycznej i antysymetrycznej ma postać

.. math::
   :label: 52.1

   \boldsymbol{A} = \frac{1}{2} (\boldsymbol{A} + \boldsymbol{A} ^T ) + \frac{1}{2} (\boldsymbol{A} - \boldsymbol{A} ^T ).


Przykład: Przedstawić macierz: 

.. math::

   \boldsymbol{A} = \left( \begin{array}{ccc}
   4 & 3 & -1 \\ 
   2 & -5 & 8 \\ 
   0 & -2 & 1 \\ 
   \end{array} \right) \in M_3 (\boldsymbol{R})


w postaci sumy macierzy symetrycznej i macierzy antysymetrycznej.

___________________________________________________________________________________




W tym przypadku

.. math::

   \quad \frac{1}{2} (\boldsymbol{A} + \boldsymbol{A} ^T ) = \frac{1}{2}
   \left[ \left( \begin{array}{ccc}
   4 & 3 & -1 \\ 
   2 & -5 & 8 \\
   0 & -2 & 1 \\ 
   \end{array} \right) + \left( \begin{array}{ccc}
   4 & 2 & 0 \\ 
   3 & -5 & -2 \\ 
   -1 & 8 & 1 \\ 
   \end{array} \right) \right] = \left( \begin{array}{ccc}
   4 & \textstyle{5 \over 2} & - \textstyle{1 \over 2} \\ 
   \textstyle{5 \over 2} & -5 & 3 \\ 
   - \textstyle{1 \over 2} & 3 & 1 \\ 
   \end{array} \right), \\ 
   \quad \frac{1}{2} (\boldsymbol{A} - \boldsymbol{A} ^T ) = \frac{1}{2}
   \left[ \left( \begin{array}{ccc}
   4 & 3 & -1 \\ 
   2 & -5 & 8 \\ 
   0 & -2 & 1 \\ 
   \end{array} \right) - \left( \begin{array}{ccc}
   4 & 2 & 0 \\ 
   3 & -5 & -2 \\ 
   -1 & 8 & 1 \\ 
   \end{array} \right) \right] = \left( \begin{array}{ccc}
   0 & \textstyle{1 \over 2} & - \textstyle{1 \over 2} \\ 
   - \textstyle{1 \over 2} & 0 & 5 \\ 
   \textstyle{1 \over 2} & - 5 & 0 \\ 
   \end{array} \right).


Tak więc rozkład :eq:`52.1` przedstawia się następująco:


.. math::

   \left( \begin{array}{ccc}
   4 & 3 & -1 \\ 
   2 & -5 & 8 \\ 
   0 & -2 & 1 \\ 
   \end{array} \right) = \left( \begin{array}{ccc}
   4 & \textstyle{5 \over 2} & - \textstyle{1 \over 2} \\ 
   \textstyle{5 \over 2} & -5 & 3 \\ 
   - \textstyle{1 \over 2} & 3 & 1 \\ 
   \end{array} \right) + \left( \begin{array}{ccc}
   0 & \textstyle{1 \over 2} & - \textstyle{1 \over 2} \\ 
   - \textstyle{1 \over 2} & 0 & 5 \\ 
   \textstyle{1 \over 2} & - 5 & 0 \\ 
   \end{array} \right).

