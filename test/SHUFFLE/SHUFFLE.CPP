#include <bits/stdc++.h>
#define N 100005
using namespace std;
int Next[N], Pre[N];
int n,x;
int main()
{
    freopen("SHUFFLE.INP","r",stdin);
    freopen("SHUFFLE.OUT","w",stdout);
    cin >> n >> x;
    Next[0] = 1; Pre[n+1] = n;
    for (int i=1;i<=n; i++)
    {
        Next[i] = i+1;
        Pre[i] = i-1;
    }
    for (int i,j,k=1;k <= x;k++)
    {
        cin >> i >> j;
        Next[Pre[i]] = Next[i];
        Pre[Next[i]] = Pre[i];
        Next[i] = j;
        Pre[i] = Pre[j];
        Next[Pre[j]] = i;
        Pre[j] = i;
    }
    for (int p=Next[0]; p<n+1; p=Next[p])
        cout << p << " ";
    return 0;
}
