import { expect, test } from '@playwright/test'

test.beforeEach(async ({ page }) => {
  await page.goto('/')
})

test('privacy policy page exists', async ({ page }) => {
  await page.getByRole('link', { name: 'Policy' }).click()
  await expect(page.getByRole('heading', { name: 'サイトのプライバシーポリシーについて Privacy Policy' })).toBeVisible()
})
