---
name: review-pr
description: Reviews frontend pull request code or diffs against TypeScript, React, Zustand, styling, and naming conventions. Use when reviewing a PR, checking changed files, or auditing frontend code quality.
---

# PR Review — Frontend

When this skill is invoked, review the provided code or diff against the checklist below. Read all changed files before starting. Group findings by category, label each issue with **Critical** (wrong pattern, will cause bugs or inconsistency) or **Suggestion** (improvement, not a blocker). End with a short summary of overall quality.

---

## 1. TypeScript

- [ ] No `any` — all values properly typed
- [ ] Component props interface named either `PropsType` or `ComponentNameProps` (e.g. `ButtonProps`, `KilnCardProps`), defined inline in the component file
- [ ] Types/interfaces in PascalCase
- [ ] Boolean variables prefixed with `is`, `has`, or `should`
- [ ] Constants in `UPPER_CASE`, grouped in `utils/constants/`
- [ ] No unnecessary type assertions (`as SomeType`) — flag if used to silence a real type error
- [ ] String literals used in comparisons or as tag/state values (e.g. `activeTab === 'settings'`, `status === 'pending'`) must come from a `const` object or `enum`, never hardcoded inline at the callsite
- [ ] Prefer early returns (guard clauses) to eliminate null checks before accessing values — optional chaining (`?.`) and nullish coalescing (`??`) for cases where an early return isn't practical

## 2. React

- [ ] Components are declared as `export const Name = ({ ...props }: PropsType) => { ... }` — never typed with `React.FC`, `FC`, `React.FunctionComponent`, or similar; the return type is inferred. This includes components that accept `children`: React 18 removed the implicit `children` from `FC`, so always type it explicitly as `children: React.ReactNode` in `PropsType` instead
- [ ] Component internals follow the required order: hook declarations → store hooks → data fetching → additional queries/subscriptions → derived state → effects → event handlers → loading/error early returns
- [ ] No unnecessary `useEffect` — prefer event handlers or derived state
- [ ] List keys are stable IDs, not array indices
- [ ] No prop drilling more than 2 levels — use Zustand store instead
- [ ] `useCallback`/`useMemo` only where there is a measurable reason (passed to memoized children, expensive computation) — flag if used defensively everywhere
- [ ] No inline object/array literals in JSX props that cause re-renders (e.g. `style={{ margin: 0 }}` in hot paths)
- [ ] Complex logic extracted into a custom hook, not inline in the component body
- [ ] Components are small and focused — flag if a single component handles more than one responsibility; a map callback that computes multiple local variables before rendering is a signal that the rendered item should be its own component

## 3. React Query

- [ ] All queries and mutations live in `src/services/<resource>.ts`
- [ ] Query keys are arrays: `['resource']` for lists, `['resource', id]` for single items
- [ ] Queries use `useErrorNotification` for errors — **not** `onError`
- [ ] `enabled` flag guards queries that depend on dynamic values (`enabled: !!id`)
- [ ] Mutations use `message.success` / `message.error` in `onSuccess` / `onError`
- [ ] Mutations invalidate all related query keys on success
- [ ] `message` comes from `App.useApp()` — not the static `message` import from `antd`

## 4. State Management (Zustand)

- [ ] `useShallow` used when selecting multiple values from a store
- [ ] No derived state stored in a store — computed values should be derived on the fly
- [ ] Server state not duplicated in Zustand (React Query owns server data)
- [ ] Store actions start with a verb (`setUser`, `updateKiln`, `clearAlarms`)
- [ ] Store hooks named `useStoreName` (e.g. `useKilnStore`)
- [ ] Sensitive data cleared on logout

## 5. Translations

- [ ] All user-facing strings use `t('key')` from `useTranslation` — no hardcoded strings in JSX
- [ ] Translation keys added to the locale files under `public/locales/`
- [ ] No duplicate keys — reuse existing keys where the text is the same

## 6. Loading & Empty States

- [ ] In-place loading uses `<Spin type='content-center'>` wrapping the content area
- [ ] Full-page `<Spin style={{ height: '100vh' }}>` only at route level
- [ ] `<Empty />` rendered when data array is empty and loading is finished

## 7. Layout & Structure

- [ ] No bare `<div>` — must use `<Flex>` (1D) or `<Row>`/`<Col>` (2D) from Ant Design
- [ ] All sizing values use rem — padding, margin, gap, width, height, font-size, etc. Flag any px unit
- [ ] Responsive columns use conditional spans: `span={isMobile ? 24 : 12}`
- [ ] Page-specific components live in `pages/<page>/components/`, not in `src/components/`
- [ ] Global reusables are in `src/components/Atoms/` or `Molecules/`

## 8. Components & Atoms

- [ ] Check `src/components/Atoms/` before importing from Ant Design — flag any Ant Design primitive that has an Atom equivalent
- [ ] `<Text />` atom used for all typography (not `<p>`, `<span>`, `<h*>`, or Ant Design Typography)
- [ ] Text props match Figma: `size="Text md"`, `fontWeight="semiBold"`, `color="var(--color-text-primary)"`
- [ ] Colors use CSS variables (`var(--color-text-*)`) — `colorPalette` from `@/config/styles` only for unique/rare colors; no hardcoded hex/rgb
- [ ] Barrel imports used: `import { Button, Text } from '@/components/Atoms'`
- [ ] Component directories expose `index.ts` with `export * from './ComponentName'`

## 9. Forms

- [ ] Ant Design `Form` uses project defaults: `layout='horizontal'`, `labelAlign='left'`, `requiredMark={false}`, `colon={false}`
- [ ] Modal forms wrapped in `ActionsModal` atom; `onOk` calls `form.submit()`

## 10. Styling

- [ ] If styled components are large or numerous, they are extracted to a `styles.ts` in the feature directory — flag if a component file is bloated with many styled definitions that should be separated
- [ ] Style-controlling props prefixed with `$` (e.g. `$isMobile`, `$isActive`)
- [ ] No deeply nested selectors in styled components
- [ ] CSS class names are kebab-case

## 11. Code Quality

- [ ] KISS — no abstraction introduced before it's needed by at least two callsites; also flag when the chosen pattern is more complex than the problem requires (e.g. using a heavyweight state management pattern where a simpler one fully covers the use case)
- [ ] No magic numbers — values should be named constants
- [ ] No commented-out code left in
- [ ] Variable and function names are descriptive and self-explanatory — no abbreviations (e.g. `errorMessage` not `errMsg`, `isLoading` not `isLdng`, `index` not `idx`); single-letter loop variables are acceptable
- [ ] Complex calculations or non-obvious logic have a short comment explaining the why or the approach — flag if missing
- [ ] Time/date format strings (in `TimePicker`, `DatePicker`, `dayjs().format(...)`) must reference `DATE_TIME_FORMATS` from `@/utils/constants` — never hardcoded inline; if the needed format is missing, add it there
- [ ] Generic utility functions (color helpers, math helpers, string helpers) must live in `src/utils/`, not buried in a feature-specific utils file — flag any function in a page/component utils file that is general enough to be reused elsewhere

## 12. Naming & File Conventions

- [ ] Component files: PascalCase (`KilnCard.tsx`)
- [ ] Non-component TS files: camelCase (`kilnUtils.ts`)
- [ ] Directories: PascalCase for component dirs, lowercase for others (`assets/`, `config/`)
- [ ] Path alias `@/` used for all internal imports (no long relative paths like `../../../../`)

## 13. Import Order

Imports must be grouped with a blank line between each group:

1. External libraries (`antd`, `react`, third-party)
2. Internal `@/` aliases (components, config, services, utils)
3. Relative imports (`./styles`, `../components`)
4. Assets (`@/assets/…`)
