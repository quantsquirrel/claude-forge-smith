**English** | [한국어](README.ko.md)

<div align="center">

```
                    ╔═══════════════════════════════════════╗
                    ║                                       ║
        ⚒️          ║     S K I L L   F O R G E            ║          🔥
                    ║                                       ║
                    ╚═══════════════════════════════════════╝
                                    ▲
                               ╱────┴────╲
                              ╱   ANVIL   ╲
                             ▕  ▓▓▓▓▓▓▓▓▓  ▏
                              ╲___________╱
```

### Where AI Skills Are Forged Through Fire

**TDD-Based Automatic Skill Upgrade Plugin for Claude Code**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.7-blue.svg)](https://github.com/quantsquirrel/claude-skill-forge)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet.svg)](https://claude.ai)
[![GitHub stars](https://img.shields.io/github/stars/quantsquirrel/claude-skill-forge?style=social)](https://github.com/quantsquirrel/claude-skill-forge)
[![Last Commit](https://img.shields.io/github/last-commit/quantsquirrel/claude-skill-forge)](https://github.com/quantsquirrel/claude-skill-forge)

<br/>

> *"Like a master blacksmith tempering steel, skill-forge heats, hammers, and quenches*
> *your AI skills until they emerge stronger than before."*

<br/>

[⚡ Quick Start](#-ignite-the-forge) · [🔥 The Process](#-the-forging-process) · [📊 Results](#-proof-of-the-flame)

</div>

---

<table>
<tr>
<td width="50%">

### 🏛️ Built on Proven Theory

```mermaid
mindmap
  root((Foundations))
    Gödel Machines
      Provable self-improvement
      Schmidhuber 2007
    Dynamic Gödel
      Adapt to change
      Incremental optimization
    TDD Safety
      Tests as boundaries
      Prevent regressions
    Statistics
      95% CI validation
      3x evaluations
```

</td>
<td width="50%">

### 📊 Proof of the Flame

```mermaid
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#f97316', 'secondaryColor': '#10b981'}}}%%
xychart-beta
    title "Bootstrapping Results"
    x-axis ["Before", "After"]
    y-axis "Score" 0 --> 100
    bar [71, 90.33]
```

**+27% improvement** — *skill-forge forged itself*

</td>
</tr>
</table>

---

## ⚡ Ignite the Forge

```bash
# Summon the forge to your workshop
git clone https://github.com/quantsquirrel/claude-skill-forge.git \
  ~/.claude/plugins/local/skill-forge

# Strike the first spark
/skill-forge:forge --scan
```

---

## 🔥 The Forging Process

```mermaid
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#f97316', 'secondaryColor': '#3b82f6', 'tertiaryColor': '#10b981'}}}%%
flowchart LR
    subgraph INPUT[" "]
        A[("🔩<br/>Raw Skill")]
    end

    subgraph FORGE["⚒️ THE FORGE"]
        direction LR
        B["🔥 HEAT<br/>─────<br/>Analyze<br/>& Plan"]
        C["⚒️ HAMMER<br/>─────<br/>Improve<br/>& Test"]
        D["💧 QUENCH<br/>─────<br/>Verify<br/>& Merge"]
        B --> C --> D
    end

    subgraph OUTPUT[" "]
        E[("⚔️<br/>Forged Skill")]
    end

    A --> B
    D --> E

    style A fill:#6b7280,stroke:#374151,color:#fff
    style B fill:#ef4444,stroke:#b91c1c,color:#fff
    style C fill:#f97316,stroke:#ea580c,color:#fff
    style D fill:#3b82f6,stroke:#1d4ed8,color:#fff
    style E fill:#10b981,stroke:#059669,color:#fff
```

---

### 🔥 HEAT: TDD-Fit Assessment

Before any skill enters the forge, it must pass the heat test:

```mermaid
%%{init: {'theme': 'base'}}%%
flowchart TB
    subgraph CHECK["🔥 TDD-Fit Checklist"]
        direction TB
        Q1["☑️ Has tests?"]
        Q2["☑️ Tests reproducible?"]
        Q3["☑️ Clear improvement target?"]
        Q4["☑️ Won't break functionality?"]
        Q5["☑️ Small enough? (<500 lines)"]
    end

    CHECK --> RESULT{All Pass?}
    RESULT -->|"✅ YES"| READY["🔨 Ready for Forge"]
    RESULT -->|"❌ NO"| SKIP["⏭️ Skip"]

    style Q1 fill:#fef3c7,stroke:#f59e0b,color:#000
    style Q2 fill:#fef3c7,stroke:#f59e0b,color:#000
    style Q3 fill:#fef3c7,stroke:#f59e0b,color:#000
    style Q4 fill:#fef3c7,stroke:#f59e0b,color:#000
    style Q5 fill:#fef3c7,stroke:#f59e0b,color:#000
    style READY fill:#10b981,stroke:#059669,color:#fff
    style SKIP fill:#6b7280,stroke:#374151,color:#fff
```

---

### ⚒️ HAMMER: Trial Branch Strategy

The skill is hammered on a separate anvil (branch) for safety:

```mermaid
%%{init: {'theme': 'base'}}%%
flowchart TB
    subgraph MAIN["🏠 main branch"]
        direction LR
        C1["v0.6<br/>score: 71"]
        C2["v0.7<br/>score: 90"]
        C1 -.->|"time"| C2
    end

    subgraph TRIAL["🔥 trial/skill-name"]
        direction LR
        T1["1️⃣ Improve"]
        T2["2️⃣ Evaluate<br/>(×3 rounds)"]
        T3{"3️⃣ CI check"}
        T1 --> T2 --> T3
    end

    C1 -->|"git checkout -b"| T1
    T3 -->|"✅ CI_lower > CI_upper"| C2
    T3 -->|"❌ Not improved"| D["🗑️ Discard"]

    style C1 fill:#6b7280,stroke:#374151,color:#fff
    style C2 fill:#10b981,stroke:#059669,color:#fff
    style T1 fill:#f97316,stroke:#ea580c,color:#fff
    style T2 fill:#f97316,stroke:#ea580c,color:#fff
    style T3 fill:#eab308,stroke:#ca8a04,color:#fff
    style D fill:#ef4444,stroke:#b91c1c,color:#fff
```

---

### 💧 QUENCH: Statistical Validation

Only statistically significant improvements survive:

```mermaid
%%{init: {'theme': 'base'}}%%
flowchart LR
    subgraph EVAL["📊 Triple Evaluation"]
        direction TB
        E1["Agent 1<br/>Score: 78"]
        E2["Agent 2<br/>Score: 81"]
        E3["Agent 3<br/>Score: 79"]
    end

    subgraph STATS["📈 Statistics"]
        direction TB
        S1["Mean: 79.3"]
        S2["StdDev: 1.53"]
        S3["95% CI: [76.8, 81.8]"]
    end

    subgraph DECISION["⚖️ Decision"]
        D1{"CI_lower(new) ><br/>CI_upper(old)?"}
        D1 -->|YES| MERGE["✅ Merge"]
        D1 -->|NO| REJECT["❌ Reject"]
    end

    EVAL --> STATS --> DECISION

    style E1 fill:#dbeafe,stroke:#3b82f6,color:#000
    style E2 fill:#dbeafe,stroke:#3b82f6,color:#000
    style E3 fill:#dbeafe,stroke:#3b82f6,color:#000
    style MERGE fill:#10b981,stroke:#059669,color:#fff
    style REJECT fill:#ef4444,stroke:#b91c1c,color:#fff
```

---

## ⚔️ Quality Scoring

Each skill is scored across five dimensions:

```mermaid
%%{init: {'theme': 'base'}}%%
pie showData
    title Quality Score Weights
    "Test Pass Rate" : 30
    "Code Clarity" : 20
    "Performance" : 20
    "Completeness" : 20
    "Maintainability" : 10
```

---

## 🛡️ Safety Mechanisms

```mermaid
%%{init: {'theme': 'base'}}%%
flowchart TB
    subgraph SAFETY["🛡️ Four Pillars of Safety"]
        direction LR
        P1["🔄<br/>Safe Rollback<br/>─────<br/>Trial branch<br/>deleted on failure"]
        P2["🔒<br/>Original Preserved<br/>─────<br/>Source skill<br/>never touched"]
        P3["📝<br/>Failure Logged<br/>─────<br/>Learn from<br/>what didn't work"]
        P4["⏱️<br/>Max 6 Iterations<br/>─────<br/>Prevent over-<br/>optimization"]
    end

    style P1 fill:#dbeafe,stroke:#3b82f6,color:#000
    style P2 fill:#d1fae5,stroke:#10b981,color:#000
    style P3 fill:#fef3c7,stroke:#f59e0b,color:#000
    style P4 fill:#fce7f3,stroke:#ec4899,color:#000
```

---

## 📦 Installation

<details>
<summary><b>Option 1: Auto-load (Recommended)</b></summary>

```bash
git clone https://github.com/quantsquirrel/claude-skill-forge.git \
  ~/.claude/plugins/local/skill-forge
```

</details>

<details>
<summary><b>Option 2: Manual Installation</b></summary>

```bash
mkdir -p ~/.claude/plugins/local/skill-forge
cp -r skill-forge/* ~/.claude/plugins/local/skill-forge/
chmod +x ~/.claude/plugins/local/skill-forge/hooks/*.sh
```

</details>

---

## 🚀 Commands

```mermaid
%%{init: {'theme': 'base'}}%%
flowchart LR
    subgraph COMMANDS["🚀 Available Commands"]
        direction TB
        C1["/skill-forge:forge --scan<br/>🔍 Scan for upgradeable skills"]
        C2["/skill-forge:forge <skill><br/>⚒️ Forge a specific skill"]
        C3["/skill-forge:forge --history<br/>📜 View forging history"]
        C4["/skill-forge:forge --watch<br/>👁️ Monitor skills"]
    end

    style C1 fill:#ede9fe,stroke:#8b5cf6,color:#000
    style C2 fill:#fce7f3,stroke:#ec4899,color:#000
    style C3 fill:#dbeafe,stroke:#3b82f6,color:#000
    style C4 fill:#d1fae5,stroke:#10b981,color:#000
```

---

## 📈 Forging History

```mermaid
%%{init: {'theme': 'base', 'gitGraph': {'showCommitLabel': true}}}%%
gitGraph
    commit id: "v0.5" tag: "Initial"
    commit id: "TDD-Fit"
    commit id: "Trial Branch"
    branch forge-v0.6
    commit id: "+Evaluator sep"
    commit id: "+CI validation"
    checkout main
    merge forge-v0.6 id: "v0.6 (71pts)" tag: "71"
    branch forge-v0.7
    commit id: "+CSO compliance"
    commit id: "+Arguments"
    commit id: "+Prerequisites"
    checkout main
    merge forge-v0.7 id: "v0.7 (90pts)" tag: "90.33"
    commit id: "v0.8+" type: HIGHLIGHT
```

---

## 📚 The Lore (References)

```mermaid
%%{init: {'theme': 'base'}}%%
mindmap
  root((📚 References))
    Gödel Machines
      Schmidhuber 2007
      Self-referential agents
      arxiv:cs/0309048
    Dynamic Gödel
      Environment adaptation
      Incremental learning
    TDD Safety
      Loop prevention
      Change boundaries
    Multi-Evaluator
      Consensus reliability
      Bias prevention
```

---

<div align="center">

```
        ╱╲
       ╱  ╲
      ╱ 🔥 ╲
     ╱      ╲
    ╱________╲
   ╱ ▓▓▓▓▓▓▓▓ ╲
  ╱____________╲
       ║║
    ═══╬╬═══
```

*"A skill forged in fire is a skill that will never tire."*

---

Inspired by [skill-up](https://github.com/BumgeunSong/skill-up)

**Maintained by:** Claude Code · **License:** MIT

</div>
