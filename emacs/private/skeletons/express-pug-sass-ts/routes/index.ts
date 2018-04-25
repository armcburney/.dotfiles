/**
 * index.js
 * Root express route
 */

import { Router } from 'express';

const router: Router = Router();

router.get('/', (req, res, next) => {
  res.render('index', { title: 'Express Sample App' });
});

export default router;
