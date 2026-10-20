import React from 'react';

function App() {
  return (
    <div className="container">
      <header className="header">
        <h1>ISTAD DevOps Training — Final Project</h1>
        <p className="subtitle">High-Availability Kubernetes Cluster with Kubespray & ArgoCD GitOps</p>
      </header>
      <main className="content">
        <div className="card">
          <h2>Deployment Status: Live in Kubernetes</h2>
          <p>Cluster Ingress: <strong>Traefik v3</strong></p>
          <p>Continuous Delivery: <strong>ArgoCD Automated Sync</strong></p>
          <p>Dashboard: <strong>Headlamp</strong></p>
        </div>
      </main>
      <footer className="footer">
        <p>Built with ReactJS • Deployed via GitOps</p>
      </footer>
    </div>
  );
}

export default App;
