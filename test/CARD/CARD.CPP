#include <bits/stdc++.h>
#define N 1000005
using namespace std;
int Next[N], Pre[N];
int n, k;
string s;
int main()
{
    freopen("CARD.INP","r",stdin);
    freopen("CARD.OUT","w",stdout);
    cin >> n >> k >> s;
    Next[0] = 1; Pre[n+1] = n;
    for (int i=1; i<=n; i++)
    {
        Next[i] = i+1;
        Pre[i] = i-1;
    }
    int p;
    for (int i=0; i<s.size()-1;i++)
    {
        if (s[i] == 'A')
        {
            p = Next[0];
            Next[0] = Next[p];
            Pre[Next[p]] = 0;
        }
        else
        {
            p = Next[Next[0]];
            Next[Pre[p]] = Next[p];
            Pre[Next[p]] = Pre[p];
        }
        Next[p] = n + 1;
        Pre[p] = Pre[n+1];
        Next[Pre[n+1]] = p;
        Pre[n+1] = p;
    }
    p = Next[0];
    for (int i=1; i<=k; i++) p = Next[p];
    cout << Pre[p]-1 << " " << p-1 << " " <<Next[p]-1;
    return 0;
}
