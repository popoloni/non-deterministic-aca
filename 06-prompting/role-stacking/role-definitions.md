## Role Definitions for Code Review

### Security Auditor Role
Focus: Attack surfaces, input validation, authentication,
authorization, data exposure
Questions to ask:
- What user input reaches this code?
- What happens if authentication is bypassed?
- Is sensitive data logged or exposed?

### Performance Analyst Role
Focus: Time complexity, memory usage, database queries, caching
Questions to ask:
- What's the worst-case performance?
- Are there N+1 query patterns?
- What happens under high load?

### Readability Reviewer Role
Focus: Code clarity, naming, documentation, test coverage
Questions to ask:
- Can a new team member understand this?
- Are edge cases documented?
- Do tests explain expected behavior?
