#include <bits/stdc++.h>
#define N 100005
using namespace std;
int a[N];
int s1 = 0, s2 = 0, n;
int main()
{
    freopen("CGAME.INP","r",stdin);
    freopen("CGAME.OUT","w",stdout);
    cin >> n;
    for (int i=1; i<=n; i++) cin >> a[i];
    int i = 1, j = n, d = 0;
    while (i <= j)
    {
        if (d == 0) s1 += max(a[i],a[j]);
        else s2 += max(a[i],a[j]);

        if (a[i] > a[j]) i++;
        else j--;
        d = 1 - d;
    }
    cout << s1 << " " << s2;
    return 0;
}
