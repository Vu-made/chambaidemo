#include <bits/stdc++.h>
#define N int(1e5)
using namespace std;
int a[N+3],L[N+3],R[N+3],c[N+3],b[N+3];
int n, m,countId = 0,ans = N;
int main()
{
    freopen("cphoto.inp","r",stdin);
    freopen("cphoto.out","w",stdout);
    cin >> n >> m;
    ///su dung lua bo vao chuong dem so luong ma giong bo
    for (int i=1; i<=n; i++)
    {
        cin >> a[i];
        if (c[a[i]] == 0)
        {
            countId++;
            c[a[i]]++;
        }
    }
    ///dung mang lien ket de
    for (int i=1; i<=n; i++)
    {
        L[i] = i - 1;
        R[i] = i + 1;
    }
    R[0] = 1;
    for (int k=1; k<=m;k++)
    {
        int i, j;
        char ch;
        cin >> ch >> i >> j;
        L[R[i]] = L[i];
        R[L[i]] = R[i];
        if (ch == 'A')
        {
            R[L[j]] = i;
            L[i] = L[j];
            L[j] = i;
            R[i] = j;
        }
        else
        {
            L[R[j]] = i;
            R[i] = R[j];
            R[j] = i;
            L[i] = j;
        }
    }
    memset(c,0,sizeof(c));
    int p = R[0];
    for (int i = 1; i <= n; i++)
    {
        b[i] = a[p];
        p = R[p];
    }

    int l = 1, r = 1, cid = 1;
    c[b[1]] = 1;
    while (l <= r && r <= n)
    {
        if (cid < countId)
        {
            r++;
            if (c[b[r]] == 0) cid++;
            c[b[r]]++;
        }
        else
        {
            ans = min(ans,r-l+1);
            c[b[l]]--;
            if (c[b[l]] == 0) cid--;
            l++;
        }
    }
    cout << ans;
    return 0;
}
